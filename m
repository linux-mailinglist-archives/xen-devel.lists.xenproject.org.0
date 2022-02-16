Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BC4B8391
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 10:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273787.469068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDk-0005zy-2x; Wed, 16 Feb 2022 09:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273787.469068; Wed, 16 Feb 2022 09:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKGDj-0005y1-UX; Wed, 16 Feb 2022 09:03:31 +0000
Received: by outflank-mailman (input) for mailman id 273787;
 Wed, 16 Feb 2022 09:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKGDi-0005Pr-5x
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 09:03:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4db97b55-8f07-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 10:03:28 +0100 (CET)
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
X-Inumbo-ID: 4db97b55-8f07-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645002208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=xn4du4McSTZakSHSLhIMNTrpFDgFlHgmcfXxyKC8dAw=;
  b=h+swo9aB5/VPSxcmyacmGvE/VqZHejF4+5RkHrpv3GdasmG3/ARf1Ufk
   akVJ8pq50UYXLa4j+WWu1H6+P4kIfoHEH0GGmMUS4g8a4uamErJyFEqco
   aAbq6P64C8+gfjrxMHCqPY1Zr4Efjhht9eHNLKurPtaqBIAII2x6zwZG3
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eXBBRENLS5qMAQ/WkGgr51csUPz+1mesK+tKLmgbgzVoNVN1w0Q1+FTSpe+YOtsFoNO5KHnb7G
 E+RZGP5X4CnX6amIhD9/TRJ1oAUPPwrki0/uTQlmpCyOoYcTYZKN6Ipp05W3L6VALL1B7DpKII
 15nyvmtP+bpXhdS2OZIjH4sfbL46Ox3Rm82FmYWE+rLYDunQwo54hzuRR7ysRJT+ZBkSxk1WDM
 9X7VoYFHHn3iR63yZ7KFCGSFEH9vEHfMMcTGbhgAK/sMJkzMn2KYepc+FK3ZwGtu/yOoZMb58a
 DT9c1rjFkZBYV5t72y49VthF
X-SBRS: 5.1
X-MesageID: 64219151
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ogkKKq0KJL2SZDMhf/bD5Q92kn2cJEfYwER7XKvMYLTBsI5bpzxWn
 zYfX2uEPv2PNzHxfY8lYI/noEME7JGGzoAySQM6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrBh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgvRv1
 okc7L6MChobHPPMkek2DzBFKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4MChWZp25km8fD2d
 8ATUxtjPAj8ZD5NIQ1LOJEOt/aViSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWlhGCa4k9FeeYTDt8YtgGEx4GIyhugUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P82rsZHF9wXsqIHZdEFBbu4WLTJQb00qXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawdRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpyLyINkKsWAvfR0B3iM4ldnBO
 hK7VeR5vsE7AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZvakU4OD7enP0E6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:QazVxakHD/MAfaoGRsauTjQS8cLpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64219151"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1CTA2wFk6gkfO5fh4f664suwHeKKFu9zqoktu063yPfuH+vv1qT8mAfnvsCEWHn/OCq9ahcYDqW3yNXtPN3Wsai1zNoqtpIbZ5EE8JB6CM+ggSGkNY1NmUC4GJSTuIHkthRB8iBEWlF2yQCN61A5ToNLuhPQv9WtWJZKsMmvBOYlp74xJsL1a1/tBjdB31ZaDGanzoEo3h8TBRRiJ/bGFcyBRCPgTfsp4rxfYlnU3QvZ/amaZerBbHAd2sEO86fJIy/lhz0TWEKgudjYdfWVjaap+hqLuM8vyY8HTwH5uxKVN8BKv5Qzw7PAUp1iSR5JbSTj4xAZxmC4u6GULJz7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECbNckFONGl7yneZ3OdlmPn6TeB2jy3nQWF/X3oEJ1k=;
 b=aZgUNs1+X44o3ew/aHJNg2BMaAUsTMYXLyKDNMJvvSZGq0YqMFkIYE2pDSbh5TJJ6HQELrl2kchinkQeXZUHVs66zpOhbAbQx49JdhC34HXPapc7FvLxoYki+3OJQhCijUYCHIaE9xoDSTJHGmdjDAgG2X61ZzD+vI3zDYOgkSshHnk9P1P7N66znUJiWT8VAfYSqV9Ur0hZfpxwRLNJukxKte7sf8FDDOaeT/+iE7+11oznsW1/sRlTQS9eVfcM/g+jybgCv2ZUM7hqzEhRAkEgqM6fbH4UxP+5ta5pL346Qb4CXygw8p3SWYmH0EQjWbloUFJdTXa+b6d9nV0Fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECbNckFONGl7yneZ3OdlmPn6TeB2jy3nQWF/X3oEJ1k=;
 b=WmiFWRX7daAck/K0b5o63oJf/dXMdwI6R6e0/be7LrpySA2DhKQSkK7qGabNwqPlrPZ3Z7o4IguG/rw9Sg2cZ5urvRmbYekI1KCJrmDs0aXq+79LIENBJNOiAq3j2tYCd6rQw00t3jhipZyUoq9ycNkutYMfAspebxgspOjXxCA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<JBeulich@suse.com>
Subject: [PATCH 2/3] x86/clang: add retpoline support
Date: Wed, 16 Feb 2022 10:02:59 +0100
Message-ID: <20220216090300.9424-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216090300.9424-1-roger.pau@citrix.com>
References: <20220216090300.9424-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0305.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::22) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2bf5a9-f891-43bf-7011-08d9f12b2f3d
X-MS-TrafficTypeDiagnostic: MWHPR03MB3104:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB31042BFF51AFBF34795E8EC78F359@MWHPR03MB3104.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nggWCyoPkeZwPkZaAvSj5CydmYzATizwU1CBat7bKOaSydQEN+/nuetyYgBsvBXVFEbnkpZggcVZkRlRidaaqFIKcbQmmqNZd53i0oYvueT3N7pY0i1dLjEcxSGzSevw44IztOZdg301qElO4Fbd5+L3jE43THrUPupL1N1xSnIqipVGLONRvid+/Zdo+Aroq7mAUZJ/3N/7qHpuHw+Xzo7Hz0DvxZVhxtF0wRlI1v/RZYFOwXUxQjKbvU8Zm6TWVJt3t+tfm6HtXZKdbZ/jrY/v1VE889RySfRrlBk8HFCoTsjU7qxm4UBIVWC8U7ppE6815SotAg7L/qWMH8gEGB47LZDjlWJ4P4gerJp8USihDlhvqptFbAEv0sXdSH3dVi07mstm/npI3ZraDggsVQeuel/ItHjPFjFurFjhZ2S+ZgGf5npz/wLBq3fCeEYmMO6deiy80m5yKTojeQacDEt+F3p1lGcJA1BTG9ywt8NBtdMSTLWrgCZIxhh8CynEehNISpDV95yT8CdMTK5jyoV3qb0dpwig8fl3nQo6CbOaBZEE2wlE6rZVXpab0yd+QqAsbuxEaX1kE8mx1aey+dTczNMFq2/fcKC1m4P+a9lTYP3+BHTETe5Ibm4QUHIk7vGM1LNgsUKA2leUS8RWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6512007)(2906002)(86362001)(6666004)(8936002)(6506007)(5660300002)(83380400001)(54906003)(508600001)(82960400001)(6486002)(38100700002)(6916009)(66476007)(36756003)(66946007)(316002)(2616005)(26005)(1076003)(186003)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG40bE1hNlZQTFJGQ0RMMll4ZUdzMlQxbG9UUGltWXVaSEduZExYV1c3K0p5?=
 =?utf-8?B?TmhNdzdQMHlKQUlkcW0xTGVQTXkyNEVqLzNqOHllVEJUM0pqWEFaTWtZdWor?=
 =?utf-8?B?MUNuaCtFU1lsendXVTVTTlJnV3Fld3pwYXozWDN0SnNmcW5EMnBOcjd4VHFh?=
 =?utf-8?B?VXJaMDU4ck1lSk9lbkQxdlJiMCtSYmxzNVJIcTFLTUVTRm5pWEtiSU8ySys3?=
 =?utf-8?B?c2lZcTQzR01vK1ArTXJmNjVhTFNSTnp5T0NlU3JCRU1OZXcxNytnamE4UktV?=
 =?utf-8?B?ZkFKNlFGRW1GQXJPaHJoNnV3Z0FEa0lLZVkxVEZ1MnZVSm1SRksrUWx4NE1S?=
 =?utf-8?B?S2JuV0FuMlBBLzlYcFQrVlhRNDdHcXlvWkk1UXB1UVFtL0JkRGNOOHNUWklT?=
 =?utf-8?B?MGtRSndZOWw5UlRkMDYwSjE1RmloVFppeHFaT2FVT0JVQWQwRDRvMTBMT3dp?=
 =?utf-8?B?dnJ3SVBJSnZRTHl4amFvNzF2TzFWVDlHR2MwRWpCNHM3aCtUS1Y5MmVDd0dM?=
 =?utf-8?B?Tm1CZG9zdlc1VEg1NHY4S05OcFFrQ0hoMENWNTFrV0IwSG5aME01QmhoN3VK?=
 =?utf-8?B?UnVWZWRTU2ZNLzQ1ZmFjeWtOOXl1eXhzODJGcjN5NVdFNEwvMlZLNUNyZjZn?=
 =?utf-8?B?K3dNeTBKRjZXQzMyMFBpczQ0cUxjQmJFY21aK1VHMVNLL1FNWE0wa0ROU1VF?=
 =?utf-8?B?T3BqaTd3d1hGQWoyVEd2L21oQlYyd1JVMGJidDhzVzRMamo1ZDhtU2tWQVFy?=
 =?utf-8?B?VXJQU3NYZ0NBU2gzcXkvM0pGcHBEMDZxRzM3NFRsWDhPZXV5TnI1UEdtblQ0?=
 =?utf-8?B?YXAydG1YR3RlKzZnRm0rY0RvTUxSLzNvb2xrRFZva2xMUVhnNm1FNW9nTjZP?=
 =?utf-8?B?elBBY1p5d01VQkRqbDBhVWRqaiszRG8vU3NLekE1ODZHdE05MEJTSEtJM2dx?=
 =?utf-8?B?cmcydzhTY2ErdnVCUitnbGFsTzBmVmxjV0VvcHlRWDhPUG5NeEJrSGYrZG0w?=
 =?utf-8?B?S0hnWlRJRFpyWDZ5NVQweVRrQW1LQzBodTFoNTBSMXlaVlppZ2luck9wUGI2?=
 =?utf-8?B?ZTJHOWsrbmtuOGZmUUNyS21vUTNXWGRTNHNneW94YlhFN0xOenRDTWE5TTRs?=
 =?utf-8?B?VVpSeEhsTVNGUlRWbmZ0eXl4OG5KdGNROFdHSWp0aWJ0Z3l4Rk5uNWlyODM3?=
 =?utf-8?B?UUNpeThPMTI3M3k4REhRSDZRVHlpbVNFYjNJYlE4YSsvYUNzd3IrWU9ZbnpB?=
 =?utf-8?B?a0xVdlhYZUtmN3luOGhuMGt1UFNaTVJPY242dWNmQnh2NW5ZUnFqSGhQd3Jv?=
 =?utf-8?B?OVlhNWxpdGhmTHYxUTFtb09NTVdYK01ieHE3YlVLZXdweFFNbHQ4QnRjdDVN?=
 =?utf-8?B?RzJpa25CVXRKUkFWZEpRcytGV2Y5cXoxUnZwYUdtMTdsbm5hMVdwbkFyaWEv?=
 =?utf-8?B?OGJBcHlMa3VoRVBQcWRsM3RITzNQamNpcUI2NTh2YkVycUtZTzhWcExURUpz?=
 =?utf-8?B?SGE3YU1wYXZJNnlLZDJldmZ2UUpJaGpyUDBLNitYdm9BbFdCSy94ZnNJdW1o?=
 =?utf-8?B?OVh0dytBNUdRS1RIdnArdWNXTmE5UGZlSUNjbzd3WlJXMzBuWURNRFBoblJO?=
 =?utf-8?B?RVdyT0V0eUc2Ym4rV3RYMmtGTnIrcGNZczhYUThGdnhSTjN1SStrYWJJQlVR?=
 =?utf-8?B?UnFmNitXaVNWWVdLTU1iWEVSekQyQTg3WTcrWGFYYnd1NCt1eGd4Zkx0N1ox?=
 =?utf-8?B?N1RMRGJ1Q3ZuY3MxcVNaS1FBaXh3Ym5lekU0cmQxRlZZNTFsSzFnT0tvS2R3?=
 =?utf-8?B?S2pMUXduM0ZxcGtRT29wdzdlZVNsTHVuVWpldm5kOURRMGFUci9nU3BycERa?=
 =?utf-8?B?eDRsYjRTV3ZqQ1lZK0RWL01YR0pzeTZ4WWdNcXdObHM4MUVOMjZsMGVTQXF2?=
 =?utf-8?B?TjkyMEF4RW9HVnMyVndlcWpzUjIwbGgxNkVpTXNxUUlNanJJZllpQmhoV01M?=
 =?utf-8?B?dU1WbksyMWpyTFlLdG1jbWg2TWlBSFZ3SzV4UTE4U25HdDNmMDdVMC80Qkhr?=
 =?utf-8?B?anMxUFNaNHdsK1VGWWNZNGpNVDJPdnlVeTJVSkd4b0lzenZBSzNBc2RuSXdJ?=
 =?utf-8?B?emJDMWVIdGcwOUdMVFRQN3NqeWNtSjVkbTh4QTAxSkRtUnlSS0ZaYnBTVXR3?=
 =?utf-8?Q?4HqOl353aUvHzRUH3tWYrVs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2bf5a9-f891-43bf-7011-08d9f12b2f3d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 09:03:23.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QW2UykXpKeIfW+3AqVdkfNjbYWd0pYy9hGN8zDvOAyJQfbY+gkxHYzjmom/MQ1e0Lj4s+kyInm4XOVBHMPhW1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3104
X-OriginatorOrg: citrix.com

Detect whether the compiler supports clang retpoline option and enable
by default if available, just like it's done for gcc.

Note clang already disables jump tables when retpoline is enabled, so
there's no need to also pass the fno-jump-tables parameter.

Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig | 5 ++++-
 xen/arch/x86/arch.mk | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2cd713724f..fe00b4598b 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -35,8 +35,11 @@ config ARCH_DEFCONFIG
 config GCC_INDIRECT_THUNK
 	def_bool $(cc-option,-mindirect-branch-register)
 
+config CLANG_INDIRECT_THUNK
+	def_bool $(cc-option,-mretpoline-external-thunk)
+
 config INDIRECT_THUNK
-	depends on GCC_INDIRECT_THUNK
+	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
 	def_bool y
 
 config HAS_AS_CET_SS
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2da4bdb1ed..f2aa2a515f 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -47,6 +47,9 @@ CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -mindirect-branch-register
 CFLAGS-$(CONFIG_GCC_INDIRECT_THUNK) += -fno-jump-tables
 
+# Enable clang retpoline support if available.
+CFLAGS-$(CONFIG_CLANG_INDIRECT_THUNK) += -mretpoline-external-thunk
+
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
-- 
2.34.1


