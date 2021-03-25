Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52492348D5E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101360.193816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMcZ-00039W-55; Thu, 25 Mar 2021 09:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101360.193816; Thu, 25 Mar 2021 09:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMcZ-000397-1y; Thu, 25 Mar 2021 09:49:43 +0000
Received: by outflank-mailman (input) for mailman id 101360;
 Thu, 25 Mar 2021 09:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPMcX-000392-Qd
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:49:41 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 159c0f6c-d9d7-4dcf-97e9-950913a5dc13;
 Thu, 25 Mar 2021 09:49:40 +0000 (UTC)
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
X-Inumbo-ID: 159c0f6c-d9d7-4dcf-97e9-950913a5dc13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616665780;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gx0RCVEUcnJ+/FXcGeKeYLnxoH0ZkeP+olypIJovcc0=;
  b=fsYlo4vlsfwgJs9PFluKPxuo9R8lWtOkrZ0QfShZ/74SjhBblatqFkyY
   TxoUfhHQFOGc8/E8x+y3RXY3hlQ1VZTxoE/uwoQhurHxbCYG7xuFwOj/r
   fiWhmUaACfK0YQ73VzZ3Xpt8smpB4x0k/U02VfZc18FMiq0JZWY+iAy9J
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qoWB19Xjk1ZGwS9CvNmCo0m4zm+TCLqJeBCjZ3/TBGfRRRWJL83lT0rrwlzQnNtmpFadGO2nN4
 eFmQOrE6/ZKwwrW8AFtG+ru9bp55NShppxtoSW8JKxK3OWuzDUP+Pa4o7cDKfT0Sv538rFNIdl
 O7vlhNFCxpurUg1SBqLyShX81/Dr/4HZh1G632DKDIZTM7kOLvkHYwLAWGOr8+x7iianxXG2Ug
 kNdZMZLjcNueb4q8kKzMNnmrM4puIaE7fDAtZw+wEE7S0BPPQBAtpYIc0+sOda+6Cwocg0uZ5G
 k7A=
X-SBRS: 5.2
X-MesageID: 40105804
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WcrUnKpDCcNQrVcYMSvBqzAaV5uZKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYytLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh5Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLsCP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUFZ5SspzYwydvfjGoCsN
 6JmBs4OtQ21nW5RBDLnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham8azhQmkW5unYkm+II5kYvKrc2U7NNsZcZuHpcDZZoJlOL1KkcDO
 JsAMvAjcwmCG+yUnaxhBgJ/PWcGl43HhuAX3EYvN2U3zV8jBlCvjol7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MISKI12IZSiJHHOZIFzhGq1CE3XRq6Tv6LFwwO2xYpQHwLY7hZ
 ypaiIXiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvCK0S4ORMTuvrlh89aLtzQWv
 61Np4TKeTkN3HSFYFA2BC7c4VOKEMZTNYetr8AKhKzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2C95H6mytR3/kkDncU37gYSXEjNdNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzXE
 YWGsKiroqL4U2NuUrY5WRgPRRQSmxP5q/7bn9MrQgWd2f9cbMJvcSjaXlftUH3YSNXfofzKk
 pytl538aW4I9i73iY5Ee+qNWqckj81qG+VSYwf3omO/93sdJ99LptOYt0xKSz7UzhO3Sp6om
 ZKbwEJAmXFECn1tKmjhJsIQMfFd9d9hw+vCdVOqW3WsHidoc1HfApYYxeeFeqsxSo+TTtdgV
 N8t4UFhqCbpDqpIWwjxNgjPEZ0c2SRCrJeBAGjbIFZ84qbPj1YfCOvv3i3mhszcm3l+wE3in
 b6JSOZQ/3NH2FQo2tVyKrs7VNyeFiMZk4YUAEJjaRNUUD9/lpj2+6CYaS+l1GcbVYP2ckxGj
 DIazl6GHIl+/mHkDqu3BqSH3QvwZsjetHHBLM4arfJxzeGM4uTj5wLGPdS4bdoPN3jqfUwTO
 qaYgOZRQmIUt8B6kiwnDIIKSN0oH4rnbfUwxXj9nG/x2N6LvzIIlhqLotrau203izBfbKv35
 p4h95u4rf1HWX1d9KcyabYKxREMQjepGaqT+cu7bBY1JhCw4dbLt3+a3/v0noC4TAVaOHTv2
 kaSL5g4L/ANpR0FvZiMB5xzx4MrpC3MEAvsgbKGecwclEmsm/DM7qyks71gItqJnfEmRD5Nl
 ae+RBM5vvpXyOM0rgBFqI7SF4mHnQU2TBH/OmYcZfXBxjvX+Zf/ECiOnvVSs4RdIG1XZERpA
 19+deGgqu+cDf5whnZuX9eLrhV+2iqBeO0DwTkI58Fz/WKfXCNiLCt+si9kXPeTia6cV0Rgc
 l9TnMrB/4zwgUKvckQySi9Sqv+v0IjnR9/2Fhc5yDQ87njxnzaE0FAORDembNMU1BoQyC1sf
 g=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40105804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zu68J0jwYedoeuIOrkAtp2K2vV0/JpPDkIftoAYFLAUIB59UftuDWbn+E7O1QiHeQUo2KzaPnMs+k14zs20itYX+q0sRU2uLDrMBFrJrnaAzb0QaKHg0F7l0CLweeC1QLWZH4aUbvnWo7OsIZbdPglXlABCQQR19R0tUdlrYe4z0F7CxV1+hE3OtyT8JC1Dg+J3vcd/z+YhCVf2Pf29DvzlOdu38D9dSv13381pWJT9/bD6AbnWxkwk/0OcVieFy3EuCujY/IyXIlcsa1Z7uZG1g4tR05FREecmz2yX8hon0I1DJRQZOPwW72rDnmXWgwYF8VUeabGspCALXcjcs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3kA/450iOyCr4RtK0VYR6nt+tQPGFcC+lro44Bw32c=;
 b=fbdDCe3pMbpWsVUGawOkBkwVstL6mLjPIsqoh5f3vwAgB8toHfX4Zti4CmR0Jo/8u/7AQKHiDKX6OXB9BeaEiZg5NSVgqKVrjIVGrDKOvpo7XW9bNtDsVIvUoNFGcgFiZBGJLobGYyogTaMGKPKn5ZEP1Xl6jrVIvammktIGWVl5E1vtr3y1cObO8rUQa4HpiUDSveJJHHN+AHxXrm6kMOZ+OyJNA61XP13l7ybzgQNkbzWjOAWRjvO1AChInmq07/kH99+vGF8iEX6ZWVfLG4xWhuSZK9v8e3DTuDZ0AFeIlZFTf3PZQ4uDJRp/u3gopSjh69ww7P723bSBFQjAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3kA/450iOyCr4RtK0VYR6nt+tQPGFcC+lro44Bw32c=;
 b=soclTTLnuvxWc5rb0ZOWEhrXsRLsRrf8fVYgsObXllrVztfaB4A1efBwPmUqsDDOySFw7g9szTVTsH/0JFPjN+4go5B/GJOyFcgglth6HrY03GsPvJf3p4qEUiPqLtHZ3wlqpmyPL9nOb8i98mUh/QYmOepi2V+g77hi/CbRDv8=
Date: Thu, 25 Mar 2021 10:49:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, "Julien
 Grall" <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Rich Persaud
	<persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"luca.fancellu@arm.com" <luca.fancellu@arm.com>, "paul@xen.org"
	<paul@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>
Subject: Re: [PATCH 1/2] docs/designs/launch: hyperlaunch design document
Message-ID: <YFxcqCtnLe0UUVdy@Air-de-Roger>
References: <20210316031814.10311-1-dpsmith@apertussolutions.com>
 <20210316031814.10311-2-dpsmith@apertussolutions.com>
 <YFODOnQRAntdETY7@Air-de-Roger>
 <CACMJ4GaWtSWAyqbgqDa-DuLy1bYCBx8E6PucxtGfVeiraAy5cA@mail.gmail.com>
 <YFrxznV1kXeXsRCa@Air-de-Roger>
 <CACMJ4GZMNfbCjTKR5ngQBMwwAfUnSOptP+UJV8BcNqKAUy9Row@mail.gmail.com>
 <YFxKjeGGTG5naH/I@Air-de-Roger>
 <FA42F3EC-AD7B-485A-9B50-8D8F8210C9F6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FA42F3EC-AD7B-485A-9B50-8D8F8210C9F6@citrix.com>
X-ClientProxiedBy: MR2P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32373b85-07c2-406a-ce03-08d8ef734bca
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29710DD8732729BF29D6A2AF8F629@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uV2QODmjC5JUrVPJIQZZuU/G2coURaity6RasY4WxmVXoTmHmz8FPJt1g5DwqkMO/zdcExlj6oeRusfts246vq60H2AHgtJt2Iqy4a1mk440DyTyrXxnPIAjhNazM5of954ybDewlhWjRCPHzYYzoaNRWy2FwNRxHkepE61lWjYwmtDOU8GlmIwHUwkPslyp4y4smQpuv/ee48A917zLnSNcPxsM0KwlEgTDOKHE58TAAVdKOX9PwR6tVlvoKFvMepXI3kXSAPJ0ZNrIaqUXhSu8q5lB/5LMShfQGSsNSdOgeG4+WorEprZvOuYAUwTTkAfAHZsWmj+ZUxjmlcyUireftzTSUzZq5mtlJjf+p93MG3/afymliFku+OiHdUXsv805bByKRXakoiHwKwt3cAkR6SvcJbDcdRgaV22KySiBMGRUPfRIPOmpmCWOj4/ExIHCa9EnUGIbhDPHHnysjFHRR9WAUQANhbBRPkTEIsEnCOhN03mjMQRFBe0U87tEc/x9XaDSdlSUeNA0HjtHMOsTGKN/bqsAdBTym/ZrJju46edde+rxOjPHOidltBhEiwOowxmDigdW5le3JKKDAw5Ai35cWkc4d/6E3k/17H4inPL16PhlTpBm+f8KeGL+0husWwGWgGrluo6g+yCrT3cP/YsTZhEpwq+Wq0Qcbbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(66476007)(86362001)(66946007)(6666004)(478600001)(6636002)(316002)(6486002)(85182001)(7416002)(16526019)(8676002)(186003)(54906003)(66556008)(26005)(53546011)(6496006)(33716001)(6862004)(8936002)(38100700001)(83380400001)(4326008)(9686003)(2906002)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NG5Fc0VNMlFPNldwVEJ5d3ltVUR2NXpnaWRrVDk3bkdoa0tubm1ZaHRXcThB?=
 =?utf-8?B?Nm96aFNpSkRSWkg5WFhQKzg2c3UrTTZweThRTzNaVW1qRW5hZThleUNITGFk?=
 =?utf-8?B?SmZEZ1E0bHdBWWhHM1kzaDZpVFhtNllRbFVFaGt0Rkt5KzhjL0FINk54M29y?=
 =?utf-8?B?Vmt0OG1acm1xUkJDTmgvK29Gd3ZHY1Vncnd3cjFGby9tOFRnczhWRGt4alhC?=
 =?utf-8?B?S090aVBUTHpKQVQvbDhWT3JkZGgxbTNNbnlJQVlVQjhxQnh3UmticFJKQ291?=
 =?utf-8?B?OUo5UHcyV0tQRTVBQ05YZWhFL3VUYmJLTi9hd2lzNlhwSm1pNlZuS1VvaU9v?=
 =?utf-8?B?RFRpcEg5aTAxYWtQYnZ1cTJRdzJiTVZLL092OFN1SVBWanRqN3orU1p6bzNX?=
 =?utf-8?B?OFRHbXBldWROSHV2UWpubmhoK2xCallvSnNmeW5SQlIwQk94ei9SRkh1aTFl?=
 =?utf-8?B?cVQ4MFJMcStTYWtjS0d6aVRuRkhsRTBtdkswZmpjOGtKZXFHTUhkSTJmbXVH?=
 =?utf-8?B?bHR4bEFNUmJZNkQ4ck00QnVhUnBUL1RLSUhka1RKVjVRcll3NHRFakllOEFS?=
 =?utf-8?B?WitrcFd3bG1LVnZzN1NaeHU3M0tJWnpzMFQyNVlHZDg3T29raU52QXJGL1V4?=
 =?utf-8?B?TVh6cUZsY0VMYjFiQURDN3ZCTWJRTWs0N0tCZzVHWERaZ3RwT2JlLy9pbUFt?=
 =?utf-8?B?RSswMkM4WTQ2MFRiN2p1ajd4NUJzM0pieitQRGRlL3BHWS9xUmNMN1dmaldE?=
 =?utf-8?B?QlFydk42R2srSHc0elMxVVRWSi9ZaHNLemFmUHJhSzRlSmdydWRtR3FTajZh?=
 =?utf-8?B?Mkdkb2pRQmcxZE9xOGVJeWxGM0ZlNk9XN3dpdmQxV2p4MmUxRGRPRGJsTTU3?=
 =?utf-8?B?WEEzNzg1SEcxRDJhQ2haczNqRE5YZ201ZDY0amtIdU5SVzFHei9lN2VlU3JM?=
 =?utf-8?B?SkNHdzd6eTFVeWMvakVYZ0xzWExUMG15NzNXc2NwSEh3cG4vWHh4UGVBOWxa?=
 =?utf-8?B?dkljRHd0MkNxSzNNcCt3WHVyTGJTOXNaYWJIZzE2NWpsdXNOOU5Xa3hxOFJ3?=
 =?utf-8?B?Z05tOE5sOGRPdmlSc3R6Z0hDZUt2Tks2emJqN0w4eDhPVkVOSEt5Q1ovckxX?=
 =?utf-8?B?ajV5aGNsWHZrZUtMeTZwY2dMd1ZYa0JKWlREQllwU0dGVVl0UUNVZnRybFdn?=
 =?utf-8?B?Y0VDSUtsblQ5em9Lc1VCdTZxRklycTRiemltSTJ3enh1ZExqMG9vRkpRK2NQ?=
 =?utf-8?B?L1NmVFFMRHhTU3BxSCs4TDZBc0dJbmg2NENGaCtjMGpMbU1udGN0aVdIbTNE?=
 =?utf-8?B?S1JPYWlTNHhzQmFWMDU3T2d1MDYzd21nVE5yRE5tMXZvMWV0djI4NmRMckc3?=
 =?utf-8?B?cUxPMFdGOU0yTkd2cllubHR0a01rclp4MDZ0eU5pTlR3MStIZW5reXlqWUp2?=
 =?utf-8?B?Ym1ZVFpaVlVpZ3E2Y0w0ZFRtZ1R5dTdLM2VRZkZRdWt1N0NqM3NhaGpYcVpZ?=
 =?utf-8?B?bG9PUFFPK0Voam5xZVplb1QvRENDSlhSQXZLUG56Y3BNcHZ5TzF2c0hObll6?=
 =?utf-8?B?QW02ZTNRemlkZ3JIZllpWGpTcndZMVEzN3o4ZUU3RGViVWJKTmduekd4QTBx?=
 =?utf-8?B?OEtsc0dycFpUQ3BVK2dzWk1zcHN4djlRQ3lQQ244REJMdVNhMjlNQXphQVpQ?=
 =?utf-8?B?Q1pLemNUNVdQM1M5SEFKODFQeUVNRlZ4dTFzYndST3lzS3FWOWs2bXVCdzdh?=
 =?utf-8?B?enVINGozY2doR09Ccmp6clVqRHlHSFpWMGllM1JxZHlYN2phbHNHVXJhaWRY?=
 =?utf-8?B?THVwNWdGeG1kU0phd0dyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32373b85-07c2-406a-ce03-08d8ef734bca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:49:34.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV0maesAhntkPX9MGWfyDjj70OtA41Pl7rFnYHS2582mq6vHIA/fYGj8IK8aIzXlH4JUYoEq6msuHsOuhIHsvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Thu, Mar 25, 2021 at 10:14:31AM +0100, George Dunlap wrote:
> 
> 
> > On Mar 25, 2021, at 8:32 AM, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Mar 24, 2021 at 05:53:26AM -0700, Christopher Clark wrote:
> >> On Wed, Mar 24, 2021 at 1:01 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Tue, Mar 23, 2021 at 10:39:53AM -0700, Christopher Clark wrote:
> >>>> On Thu, Mar 18, 2021 at 9:43 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> If you offload domain creation of guests with
> >>> pci-passthrough devices to a control domain and/or hardware domain,
> >>> I'm not sure I see the difference from normal domain creation, ie:
> >>> it's no longer something specific to hyperlaunch, as I could achieve
> >>> the same by using the existing xendomains init script.
> >> 
> >> So that's not what we've proposed, and hopefully not what we'll need to do.
> >> 
> >> Do you know if there is a need to perform work to support the
> >> assignment of PCI devices at the point of domain creation (ie. in
> >> domain_create), rather than handling it in a later step of domain
> >> configuration, prior to the domain being started?
> > 
> > So while I think you could indeed create a domain from the hypervisor
> > in a paused state and attach the pci devices later from a
> > control/hardware domain, I don't see much benefit in doing it. If you
> > need to end up waiting for a control/hardware domain to attach the
> > devices and unpause you might as well do the whole domain creation
> > from such control/hardware domain.
> 
> My understanding was that one of the primary advantages of domB was
> that you could compile and run arbitrary code in whatever language
> you wanted to, using already known tools.  If *all* we want to do is
> to assign some pre-defined specific BDFs to specific domains, then
> sure, we could add that capability to Xen.

Well, it's not so easy because we require QEMU or pciback ATM on x86
in order to do pci passthrough to guests, so assigning BDFs to
specific domains from the hypervisor would need to be done using vPCI
(which is not yet ready for unprivileged guest usage) and only support
HVM kind of guests strictly.

Doing passthrough to PV guests directly from the hypervisor is
impossible AFAICT without putting pciback inside of the hypervisor.

> But suppose you wanted
> to have the flexibility to handle changes in hardware at boot time?
> “Scan through the PCI bus and assign anything that looks like a
> network card to domNet, and anything that looks like a USB
> controller to domUSB” is something you could easily do in domB, but
> would be way too complicated to add to Xen.

Right, but then you might as well create the domain from domB instead
of doing it in the hypervisor?

I'm not arguing about not using domB, I just don't see the benefit of
creating a paused domain from the hypervisor that then requires the
intervention of a further domain (domB) in order to finish creation.
Won't it be simpler to just create the domain and attach the pci
devices from domB?

Thanks, Roger.

