Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D27348B99
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 09:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101299.193642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLPm-0002Za-Fj; Thu, 25 Mar 2021 08:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101299.193642; Thu, 25 Mar 2021 08:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLPm-0002ZB-Cd; Thu, 25 Mar 2021 08:32:26 +0000
Received: by outflank-mailman (input) for mailman id 101299;
 Thu, 25 Mar 2021 08:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPLPl-0002Z5-6G
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 08:32:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fd358e3-5ca9-4315-affb-dd81a36b8067;
 Thu, 25 Mar 2021 08:32:23 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6fd358e3-5ca9-4315-affb-dd81a36b8067
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616661143;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=amYIsVw8zmnTOdkTjgkE+QwgHVtqS0153MlLRgZ7coo=;
  b=LvoCq74A+l2CT0TnQqurs72bkfVvCo0SekPuRkAJwtJL/cnDrWl/9Kf8
   tVneArAkf5L+FPdUb4T3EaiNmfYmpK2oHu3M+j70/paFWc37XU7TJnhWF
   SEWxRUH6+zeW3OxlWzH+3fFU5lGjN7ZZKGHwW4BTba/h0wca1Ky30JqiS
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Se3jxdsuBFJvUfpgD8poyzt/hmPeUsmlnf7ZJ1lbjmVnxI+yFMP9ePxaUgaP1perNkjxtf6MNR
 399AF+IEHPJl7VV3GuCIPq1OhDJS8xi9AXNEuH/Mej2l2GrB6eRbYAj5NL756DkniY0ygMRWUF
 YmKB8uHgsprV2DtEXXAkNJc2FpNwZM/URXmQ0q/vAbYRyfeDOq0pNu/Qnw+xvj8LuPElqnG3lk
 NB85KfbZTSeIbKVQluWEgkozH3V8I91Hr/4CS1FZTWJM9hYxrc52UaFEpUu5sjpGpC0d1M+19G
 cRI=
X-SBRS: 5.2
X-MesageID: 41539134
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Leg8s6iAu+xlEWA36I3XrWjtenBQX2pw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIzVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpL+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIz/Z4J92
 /Znwvlopiyqv3T8G6m60b/zbRz3OHgxNxKGdCWhqEuRAnEpw60aO1aKt+/lR8vpuXH0idOrP
 DtpFMaM913+zfteAiO0GfQ8i3B9Bpr1HP401+fhhLY0LzEbRY3EdBIi44cUjax0TtYgPhG3K
 hG332UuvNsZHuq9kSNhKm7azhQmkW5unYkm+II5kYvKbc2U7NNsZcZuHpcDZZoJlOK1KkcDO
 JsAMvAjcwmF2+yUnaxhBgK/PWcGl43HhuAX3EYvN2U3zV8jBlCvjUl7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MIeKI12IZSiJHHOZIFzhGq1CE3XRq6Tv6LFwwO2xYpQHwLY7hZ
 ypaiIWiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvCK0S4ORATuvrlh89aLtzQWv
 61Np4TKeTkN3HSFYFA2BC7c4VOKEMZTNYetr8AKhOzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2C95H6mytR3/kkDncU37gYSXEjNBNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzXE
 YWGsKjroqL4U2NuUrY5WRgPRRQSmxP5q/7bn9MrQgWd2f9cbMJvcSjaXlftUH3YiNXfofzKk
 pytl538aW4I9i73iY5Ee+qNWqckj81qG+VSYwf3omO/93sdJ99LptOYt0+KSz7UzhO3Sp6om
 ZKbwEJAmXFECn1tKmjhJsIQMfFd9d9hw+vCdVOqW3WsHidoc1HfApZYxeeFeqsxSo+TTtdgV
 N8t4UFhqCbpDqpIWwjxNgjPEZ0c2SRCrJeBAGjbIFZ84qbPz1YfCOvv3i3mhszcm3l+wE3in
 b6JSOZQ/3NH2FQo2tVyKrs7VNyeFiMZk4YUAEIjaRNUUD9/lpj2+6CYaS+l1GcbVYP2ckxGj
 DIazl6GHIk+/mHkDqu3BqSH3QvwZsjetHHBLM4arfJxzeGM4uTj5wLGPdS4bdoPN3jqfUwTO
 qaYgOZRQmITd8B6kiwnDIIKSN0oH4rnbfUwxXj9nG/x2N6LvzIIlhqLotrVe203izBfbKv35
 p4h95u4rf1HWX1d9KcyabYKxREMQjepGaqT+cu7bBY1JhCwIdbLt3+a3/v0noC4TAVaOHTv2
 kaSL5g4L/ANpR0FvZiMx5xzx4MrpC3MEAvsgbKGecwclEmsm/DM7qyks/1gItqJnfEmRD5Nl
 ae+RBM5vvpXyOM0rgBFqI7SF4mH3QU2TBH/OmYcZfXBxjvX+Zf/ECiOnvVSs4WdIG1XZERpA
 19+deGgqu+cDf5whnZuX9eLrhV+2iqBeO0DwTkI58Ez/WKfXCNiLCt+si9kXPeTia6cV0Rgc
 l9TnMrB/4zwwUKvckQySi9Sqv+v0IjnR9/2Fhc5yHQ87njxnzaE0FAORDembNMU1BoQyG1sf
 g=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="41539134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+Ux7iS4js5oV/DVd+2HsjcLgB5SezvBf+OmVXhWTtcpmd6y0UChBZ7oV4OjUgb14I6fxFsM4dk2jqoE4T/bkiEa5RidUWlshss8OcaE42GHRDseNL31ySfe6z4XI37+Y/ZFpgE+30LXcTF0549tpQs2+eseELKxGyBueiB78U+DT23ydnvDDq7T/rdosNcqCmHnKQFc0iDSGPrTLf4pw9leboBSYMxwvpVus0U3k/OWv4BHl6XTLJXd4kpx0ixqjhJ8k5hBEx6Fv6QBIpMwFOv/1K3n7lr88/rufhsQV6yNSMXtMfSTMAret1rxFgmNTwB5aZD+99Jy9vJ3dBipwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqIKGjeSyaprxH/bwphBFRAhYHRxwXZoMYk8NKmpd7M=;
 b=nZjsnxlHv5t/dZtrTujTC3/hSJdJtwS5bgqaLQdFfWawKcxeyuRbqXxDw0PwX5Fzmebu9NWzG0yogg2/grsmZZPmJSslFdlBPJjGyWoDTJsjBeiMwWRa4mAeLzr4/UQjvzJMGQ4s9lGB3JGMCuo2ACr7mFKQppmRDmIjzOiWZ+zJc/Sbpr3dmaYxR00gaW8BHWdF4+XOgnNqYjDSSEAE+tWTQ7PNBTepLhZ74BJClmHDviC6DiEPfJ0bJqhzDv/9B1Ge/G6LYWZl8y9Pw3WMcB17IEk4cg3/vba9H2Kr1vXehfaPFWa7Kflwurb90zwKiB8UswSR0nJZR2qh+dRvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqIKGjeSyaprxH/bwphBFRAhYHRxwXZoMYk8NKmpd7M=;
 b=ScjVsqoyt1lAEipbD0EYkY6s8ExlLgT4Srz3h0Ux8BiI64tP2eduq0uIm4wy9xARGu1eKGC+yeEmmUcbMVGteJjDabgFoScgvkRIImY63G6wP0KxfTK/vJWjn7on6gvOQxBLr/SYQ9XVLSYjGkC4ed3bwp6CyQnZO3FE3WE1LtE=
Date: Thu, 25 Mar 2021 09:32:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall
	<jgrall@amazon.com>, Julien Grall <Julien.grall.oss@gmail.com>,
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Rich Persaud
	<persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	<luca.fancellu@arm.com>, <paul@xen.org>, Adam Schwalm
	<adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Message-ID: <YFxKjeGGTG5naH/I@Air-de-Roger>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
X-ClientProxiedBy: AS8PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7ff887-ee0f-45b5-9e2f-08d8ef688181
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB55916DC181735120706A08078F629@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aoeVhFqZNqJdEy+6UL2QZx7B+dGE/Y1sebDlUSsl8k6K/iIaXtBNkbatBkFjKGsEMXYRiid2iZFLOVGTgw7HJ1B9sE3D7QIDkIMIi5GOoD/XBmBITVTRePpr8qrWmlyOsw0LcsWjerpyVKR8LgJ+L2OtBUJUKNriq/+797no+NsiloffQ71BMqH0nbwoKujy+FvUMQgnuepKqdbcfHpagpBTC6gq+nxqEWowtGvZ2aIPRlJpmvwxy1+Qw8RMZJlprusxjKwRKWq7xBTJRi+JRe10QXAz7FhdnW9xHGtMwZoRnTtIyF+VUXJFIe0PQvQ6dr9kHuxCALwY0SaGds6ViWvHoh6Pj0zuQdMgO8+51C2HiZJxeB0ZQW1OuATfYPmllho+aiN5bMp+FydCw1k9gq3dgdPnUXcSF5pDmlFge1RjGKvKKEhLHs/+9p2oc5lNEG2wJsmPjnJq3cC72XMMYJALzdNQinyc4VyVgYop5fuvGQZ3iGRis8RJrjLRfQnFn0MbkhKqzRvFDJxvfKwglWnT18fxP8h+F+He+dAuZ/GgisjqhAdDl8Dl9g2YZlFUABLMCnDyYLDO2rVqa06onxDBBk9rPuxOvrNtHm1zOruS9exzB5aS5SgSFGXDoGqxa6vg2/1SdodNkq45VWCVKOeVy5cb81K2sKYOGV7m8wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(8676002)(86362001)(316002)(54906003)(9686003)(38100700001)(85182001)(478600001)(7416002)(956004)(4326008)(66946007)(16526019)(2906002)(6496006)(6486002)(33716001)(186003)(53546011)(5660300002)(6666004)(8936002)(66476007)(66556008)(6916009)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGlIVVkyQi9JMUxjR0NQbWcxbFBKUzlTSVN0VDEwSWYydGdlVEQvWGdldHpW?=
 =?utf-8?B?VFZNVHlRWUtqUmgzbXF2YVcybVdrTFNnb1NVS1p5RHMyWnBQQWx2NjJIbjAw?=
 =?utf-8?B?UTlBbmN6MmdRVjZmTHFndE9nQjdLVVRJNVkrbVRWd0lrcGRaVXdyc0hFUnZT?=
 =?utf-8?B?djZFL3YybEp6NGRZS2d3amtJci84VHNCcXRhNTJUNU5pUjFRa0lCdnpsbnd3?=
 =?utf-8?B?bWJ4cHlIWlljdEwyN3p4aTJrMDdlQUpQaUt5TThtd1BWMVdSL3VFTU9HbDJ0?=
 =?utf-8?B?VnYwZlpIU3FqNVJTeTVpUW9rRnJ3UXR3SURaU2ZTcGZkRnplMmsvSW5TK3Zv?=
 =?utf-8?B?bjMxVUQ2ei9Mc012ZXM5Nmg0RWpKSkVsMlhQZ3picFlnMEJHMDhpRERYRWt0?=
 =?utf-8?B?OG94bWhjV3QzUU5yUFRWNG01UnBhbXoxOXVFUGdPZ294YjNlU0pla0ZUZ2ZU?=
 =?utf-8?B?eUNwQnVJVFFEQWlSMW1WMk16MlFMSkdUci9mYVo0TjZsVncwd1ZrUVQ0VlM4?=
 =?utf-8?B?Q1ZqZFBUeWlSa1dCKzNpQ3RrRURuSG51cVJZM2NzeWtKQ0ZrTmpDNGFJQ0kr?=
 =?utf-8?B?T1ZMZzBIcTJFZ0I1bm80MDEwTHJ0NEJhTmxVVWFtZ3FtdTV3RDcyVkdKOS9k?=
 =?utf-8?B?RzJIbktDQlRlLzVKdm50d0ZadjRyamVBZ0pBb2JZMWJ5dmNxNkZ0cjlvRUFr?=
 =?utf-8?B?QnUrdUk5TTIzQjZSUmdZYzJPby9teVZyYUJscE1HeEdOMXBsWURmQ3lzZ2ht?=
 =?utf-8?B?UUlTSTBWM0xEZlY5bVlxZjc5cnVGOE9uT0p6MndnZ1VJUXcrMys4dHNoVkxx?=
 =?utf-8?B?OExWWFlqNkVJcDhET0p5clB1SVZSa1NzbDJLUytzdjZ1QkdaeXdRTUdHQjVV?=
 =?utf-8?B?cS9BSU5yMk9DRVpGYTFVTWFyY3JVSW9EeUdIMFhvOVJNQ0IySDFMb3Q4NVBo?=
 =?utf-8?B?S0pKRTVUSmxGcUFJVGxOWUhXMG9aeWMzNUJUS0lsVnlXdDBza0g0R3p1cE10?=
 =?utf-8?B?QnVjOGRXdlFBaWlhblRrb3MxNHZML2MwelpraEtkWHRBc2tnTXRwSXFSUlVO?=
 =?utf-8?B?QzNUMUhZMktiS0wyT0FnSmhpWEZBYzA2TjV4SUNJYlJKNGE1ZEV4dENueDA4?=
 =?utf-8?B?V3RIUnVFVmZaMnJpZlVIYzNDaTZMeUM0TGlvR2h6dzhCTzJuUm1oc1U0bnIz?=
 =?utf-8?B?M0svTkNIMmJCVVhjaDNrQktwRkE0NHFVRG5nRnZGQXdkWVVpMkx2d0RlM1NV?=
 =?utf-8?B?VFM2THdLQnlhU2xLenRYVk05VzlzaWI5T0cybDY3K3p5Rk5VaEEzeDg3Ynht?=
 =?utf-8?B?amU1UDFtUkUyb0pEZWVVajR2RkpqdzMzVldxdEM3Tk9XQ2hJdjJjOVBSSE9V?=
 =?utf-8?B?SGtCa291VXM3cEJtQkw0Z2VYWE56UFRBUFNQOGd2enBCeGQxN1lGamhkcVVI?=
 =?utf-8?B?c2dzNVpsaGRkS0wrUFBJMlU3V0tneTBFS2tCVW9hUC9yZVR4QnYvZEVCMUhX?=
 =?utf-8?B?TFZMbEpNREhEbC9ReGxsK2FPbkZlODVSN2dkZkMyY2szNW84VitvdlFNWVpX?=
 =?utf-8?B?TXhlc3VLNHBETEwyd2dab1UrcWt2ZW5tNkJpbXJ4elZneG9oendlRlQ3dGha?=
 =?utf-8?B?N3hRS3Y1dXRreXJuSHBhajVNQnl6RFA3cmpFN2gxRDhoVnlkdmVZN3NUWlVt?=
 =?utf-8?B?NzVpMUhkYytLb3lWNENjcjI5WVU3enl5Z3dHcEhGN25MdVVFYVRJeEtkMzdt?=
 =?utf-8?Q?JINbOf/vJxxrARlFAS68a+ikIC+/hpnwXjNSQuH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7ff887-ee0f-45b5-9e2f-08d8ef688181
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:32:20.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWGGoudidyfH3reY5uD0Jw1dw6QIhI59kjdHOUL4doaSTuPCkbGBdhUcnhbD2ZdUzOrd5kC4Zl047eDpk0LhWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Wed, Mar 24, 2021 at 05:53:26AM -0700, Christopher Clark wrote:
> On Wed, Mar 24, 2021 at 1:01 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote:
> > > On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > If you offload domain creation of guests with
> > pci-passthrough devices to a control domain and/or hardware domain,
> > I'm not sure I see the difference from normal domain creation, ie:
> > it's no longer something specific to hyperlaunch, as I could achieve
> > the same by using the existing xendomains init script.
> 
> So that's not what we've proposed, and hopefully not what we'll need to do.
> 
> Do you know if there is a need to perform work to support the
> assignment of PCI devices at the point of domain creation (ie. in
> domain_create), rather than handling it in a later step of domain
> configuration, prior to the domain being started?

So while I think you could indeed create a domain from the hypervisor
in a paused state and attach the pci devices later from a
control/hardware domain, I don't see much benefit in doing it. If you
need to end up waiting for a control/hardware domain to attach the
devices and unpause you might as well do the whole domain creation
from such control/hardware domain.

Is this split done because the control/hardware domain would have a
very strict set of permissions only allowing attachment of pci
devices but not domain creation?

I think the permissions required by a control/hardware domain to
attach a pci device to another guests would end up being fairly
similar to the ones required to just create a domain from scratch,
because a pci attachment requires modifications to the p2m.

Thanks, Roger.

