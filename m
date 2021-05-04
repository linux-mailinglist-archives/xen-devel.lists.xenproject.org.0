Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61D372B55
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122439.230937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvPB-0005Z6-JW; Tue, 04 May 2021 13:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122439.230937; Tue, 04 May 2021 13:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvPB-0005Yh-GB; Tue, 04 May 2021 13:48:05 +0000
Received: by outflank-mailman (input) for mailman id 122439;
 Tue, 04 May 2021 13:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldvPA-0005Yc-LT
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:48:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b3ae563-2125-4f75-98fd-08d3916ddee6;
 Tue, 04 May 2021 13:48:03 +0000 (UTC)
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
X-Inumbo-ID: 0b3ae563-2125-4f75-98fd-08d3916ddee6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620136083;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HHC8OgU+UvKDTasAmy0Hu4u+yA6GwDKmbQwchjgRri0=;
  b=XmUrqMv/m4uDOorMg54aIbGanSynYYdIPk8ymGN1ozJKsxTBGRcgYEpX
   Niv7IM6uWlk8JDgt0QpgOiyB2S3VKn0dWLAZz/fR1JiNWpzQ4Yms7JLct
   eiDAA8qnh3wZkQf1awgodIFczPyiuneIQzHvxQnhFnRFh0md9/AI0AoLh
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PJQlRY/+d8D4a3m2Clralt4Swr/ROoqee9aiZALqr68V6do4S/DcwxfXfVqEm+6LeDQQ4U+wf/
 Z1gMdt/aC5oC+S8nYC7hdMtN5l5rWtrz8YinU2DjaqnVN1b4Ek5Glmo78N3PEcaJdiO2y8QQFZ
 YTGqKPcgtFR/d0rFP2W+E4Yle1SFn+ouR9TbDQwKRzbfdot76AylA760eRjj3Qp9cq5YD5qj7c
 YdAxnoyhEn5QczxKf5tDK2VOOrNGHYxQrwpsi/uJVXnB09pfEr+IzOrTHnrmrjAlRA2Mx0M+c6
 rq8=
X-SBRS: 5.1
X-MesageID: 44542174
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9ySOCqhDMcOkGy1IO/ccKe235XBQX2pw3DAbvn1ZSRFFG/Gwv/
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
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="44542174"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVXNYOTyK3RsciURKI+HPtL9soB5IqF04opAhHjqtgQQUrB8ZtX8PhdRjLPQCyE2gPTAFzlzkWO2D1/+VjhNqIsps9v+NQN1RcPIl1ZcdIh5kClU49OD49G3cTtCKnvMuJe+2H+4F07cakakW5fr9b4sjfX/sdcI2V3Rq2WDtjVteaCyXoPinbRPx9EEcASJMN50ft1yIF2yeKjAUSH/GxQqMVpG1EFQP+o7TIp4VYxCwErdBLbBlZbNtCRyLY2yfEr/ebIZX9RZDrRXI+kC48I76f3rV8369xB4oGhjMh9eb97KDj/NhoHInuZYAQFJLtykn+L6SvfxGhCuJvP34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZrKNOq23P+B+xPjn0c6ttemAMfOK/ov2+s6p8L+gKo=;
 b=P0/8FfTmwV8rezlNueayLL3oqFMKqiHWi4v42jXai58YzPlTyiWccp243Afcfo/5XT8Ohl7xbTwxDUmNy+mSiYnBHdBKMoj6qtE1/ySuTPjBOrvl1tfY+uFv+2mkh0Ht3lLCnvffmCB8SHdIUF952bZGBeyOtbo9sH/mJkwg4AkHcok/X9vSqr0ynM+44mAmCpeQLrcxeN9tYNoHL8P7kCIrAyBu1QKt0uub/rr6oST9y/ikxW8y5TZ8UodRId9rprhBt9QEKcbm7gzZBQ5mAMMuvsjuO/QLH28zjzAeKEH9aYeMyACBiG2fA/JNav2bIECM/ISxoMAZOyhZApg3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZrKNOq23P+B+xPjn0c6ttemAMfOK/ov2+s6p8L+gKo=;
 b=Nzxw4V4zFPc07WzHBTCEAFCc+ndrTQ03ihVixwvYWFlKiIMdlUa7PTZvVaWnzXlFtDBw8W/pTNOL9MJznrqAmS3+3ql+EQ6asxulmYF7mzv1XKnlj2z08wOs3Ha1GwqEu6ibEqJ11JrRpqQDAu2YIbd3CqpXeadoC5ZJ3KaUGP8=
Date: Tue, 4 May 2021 15:47:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3 02/13] libs/guest: allow fetching a specific CPUID
 leaf from a cpu policy
Message-ID: <YJFQifk/0nXCuMJT@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-3-roger.pau@citrix.com>
 <76e5e596-24bc-9d91-e654-cef1115e5139@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76e5e596-24bc-9d91-e654-cef1115e5139@citrix.com>
X-ClientProxiedBy: MR2P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::14)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 062e5ed5-f2b5-40c8-6d0a-08d90f033a71
X-MS-TrafficTypeDiagnostic: DM4PR03MB5965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59651DCF4435BF91AE4333528F5A9@DM4PR03MB5965.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kM55c+r8aBYMBEZtjxG/1HyRoV4sNy4o2UKLPje0aJlD1xrH/jRgzkQbbCAjSauoSWSj9aTO7vvtbnb09JoOjqzXP6qlnzpdxxTbm1Qf0IbIHEe5u0OQNXio7oormm1yFUFkEi+zhAfN4r8zF/fsBCgSUq69MqwEMLZcdWIiDlx5yOV8yaakFFKA268Jo0kOskDtTQC0egfmWHJXoU/Mc9KKPiUDyux4N+/sZ2xig6eIlCZtUUiIlULvoi9iiFLJQ4eHlSRQX94y/sCasNIHVqJegxleJISPTg1DtVIePYBwKrbOW/ALpPxnJ+/psVn+sVl2+Py5J//OTf9mIpdp4zn02Y/gNmFgk+P3Rnt7sypHISeZHuvsC2JV0ygpHW6DxOz2pTUytHMXL+l1aTzLM9b8Mjbiq+0NePp9ChL2Oyd6xcKcTFt36cCJhcry1mpwk/F2P153TXl+16UdcvUnkSEdErmSvkWNOrUAAKKFOTF/xbP/k2o4+CU/MfwCqxfRnGgGfj7d8gSGmYtpscCunupdrSk2xjh2dnj5diQX/Pq9Gxqe26VvWKvZjMBfkKSPZnV1TL0Iq2x846FVpJzgTUvZys0tPFITH27nswgP9RE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(376002)(39860400002)(366004)(54906003)(66476007)(5660300002)(2906002)(6486002)(38100700002)(316002)(6666004)(66556008)(4326008)(66946007)(26005)(186003)(85182001)(83380400001)(6862004)(6636002)(16526019)(9686003)(8936002)(956004)(33716001)(478600001)(53546011)(6496006)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXBVRXpVOTJvZnRkb2RydUNwUkFoTy9hOU82L2t3blNhWW1oc3g5K25XZFJH?=
 =?utf-8?B?UUFmQmVUNVdWOXp5NytNQlpyN0phTmtPSHBrVzZuaVltd29taEJTQllkcXV2?=
 =?utf-8?B?Snh2OXJpTGYzWlZWMm85L1ZwQWpFaEU5eFF4di9kSm5UaFpBZlFhSWxCTUNL?=
 =?utf-8?B?NUxVa0p3N2ZLOUlBcDdMT2JOU1Q3aFQwNnFaWWRlTFF0LzR2U2RPb0FZU3pi?=
 =?utf-8?B?ekl3dVdNeEkvUU1oTFNzWGtpREhIZDFkdzEzYlVyWGNzK1VWVFc5b2hNbFNS?=
 =?utf-8?B?TU9hUDRqZFRCVVRzWFBQc04wdEVEcDFaeWk5USsvL3hlUkxaVWdKeURlSHFO?=
 =?utf-8?B?eVl2SHQxVFJONVZIdkZLNW5CZm40Z25PclN4TVlEWDZrSTdkM3c1OFBwRWhY?=
 =?utf-8?B?M3lJSi9vRVNSajJ6RGhkclFCS0U5L3UxclFXSDZyNUdjNkRNRlpHREhVT2tW?=
 =?utf-8?B?cmVaaGpmT1Y0cjJkUjNPRFJPV2w1YUNZanNHNmFDRmFIem5OMjRUakQ1TStk?=
 =?utf-8?B?V0tlU2RQSW9GWUFySkJNOE1DdisxZlZhdVVNR1VQeUhFTUFnZGljMHkwSVdr?=
 =?utf-8?B?d2RRcDRQQk50cC8ydDYvYXlVTzlWTEFUalhKQnBzSGM4ZnN2K2U3MTlBV3I0?=
 =?utf-8?B?SFRLMCs0eHJGcFgrczlUaGRNelIvTm1SeHplR05lVUJMVjFmTGxUNzd5eHZF?=
 =?utf-8?B?d0lkeDlMVWRZVENpTEcwQWlwYzBnTDQ0dHBtOUk2VUdOejBhN0F6dCtDTU83?=
 =?utf-8?B?MkV4cDFTcE1YL3NaR2ZGWGU4YWhtcUQzKzYxWE82SVhtaXMzMmw5d1JjaTY0?=
 =?utf-8?B?dXhOUDBRWnp5TzVtcStkRkVFcnFLZmp0N1VmdFVIOTJVWGNFNTVwdGxhQkkv?=
 =?utf-8?B?emJGS3ZIbzQ1Qm9CVUYwZVNHME1UanJnZHdZQktqRHlUR29RMnZGdXJ2dnhN?=
 =?utf-8?B?bTM1Mm1IMk9rTTlXczVVeUpBemNQeGw4VnF2emxYcXc5RnErMmFOVFNkQkRU?=
 =?utf-8?B?RVNpQlNkZWRZNXV5NFRveUlvRjBWSlhZQUszcDBINmRwV0VpeVBWOXBKY1J2?=
 =?utf-8?B?RVpXKzJjS01CM2EwWDgvdC9rVmJVdlBFN0h4YVBYSG01cWtiN1lUUXFxQk9Z?=
 =?utf-8?B?eGViT0U3TEZHYnRPVVIxWFlSRGZ6VmtHalE5aTRwUzhQcWFObnZiV0ZlTk5N?=
 =?utf-8?B?c3ZUeW9UbGlqeVNLUUJuejFFeTZMTWNmaFgxTVBDUm40OE90Z0R5WFZuQ1l2?=
 =?utf-8?B?SkFmeWtXZEpXZkNYbGphTHBYYzRGanhXRFo0QTAwSDJMZmZhN1ROMUJRNitF?=
 =?utf-8?B?TkQ2VGovQ3p2dU5IUis5VjJDRlNkazh1dVltR3pYWWtZRE5FZVFmWVFlNkVD?=
 =?utf-8?B?Q0ZsN3VpQVAxUUprNjJldjRBWmRzcUZDUDNjMlBQYjJ2NlgzbVNlVWhyT0cw?=
 =?utf-8?B?Nm9QUzVwMVMzR2RWRXZycS8rK0JRR3hGNUlraHcyd1ByYWRPaE9QNUdtMlNw?=
 =?utf-8?B?WUJOTmxzNURMOWxSMks0WHZOYVZKWWNibXZvNXNGc0owcVhselZaYTM0VUY3?=
 =?utf-8?B?aFFNck1oRGpTdHltY0hZcHc1Q3c0c256bGhQYkxjbmd4RnNTVFVxZC8zRlNl?=
 =?utf-8?B?SjRlMy81N0ZvOVJWTDFSQ0JzR1BudE9sUXUyUlNsYkV2d0ZBbTFNa3YyZDhC?=
 =?utf-8?B?QjhPVTAyZ0ptNVAydXNLWXVXM2RkRXlRMm41WjZBN2R2QXlsSlJxSURveTV4?=
 =?utf-8?Q?t3e2RYbrSz69wlgAv1SFPckXnypJj/huw+qq/wR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 062e5ed5-f2b5-40c8-6d0a-08d90f033a71
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 13:47:59.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTNb+RorE07VkGOKAq3R3jzLTY9HDEAVGsf/gno001ozXfE9nvHkzfMlSGGp2qXPj+Y8oz+OkjtP2530IuPwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5965
X-OriginatorOrg: citrix.com

On Tue, May 04, 2021 at 12:59:43PM +0100, Andrew Cooper wrote:
> On 30/04/2021 16:52, Roger Pau Monne wrote:
> > @@ -822,3 +825,28 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
> >      errno = 0;
> >      return 0;
> >  }
> > +
> > +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
> > +                            uint32_t leaf, uint32_t subleaf,
> > +                            xen_cpuid_leaf_t *out)
> > +{
> > +    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
> > +    xen_cpuid_leaf_t *tmp;
> > +    int rc;
> > +
> > +    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
> > +                                 NULL, 0);
> > +    if ( rc )
> > +        return rc;
> 
> Sorry for not spotting this last time.
> 
> You don't need to serialise.  You can look up leaf/subleaf in O(1) time
> from cpuid_policy, which was a design goal of the structure originally.
> 
> It is probably best to adapt most of the first switch statement in
> guest_cpuid() to be a libx86 function.  The asserts aren't massively
> interesting to keep, and instead of messing around with nospec, just
> have the function return a pointer into the cpuid_policy (or NULL), and
> have a single block_speculation() in Xen.

libx86 already has array_access_nospec, so I think it's fine to just
leave the code as-is instead of adding a block_speculation in Xen and
dropping the array_access_nospec accessors?

> We'll also want a unit test
> to go with this new function to check that out-of-range leaves don't
> result in out-of-bounds reads.

Sure.

Also, whats your opinion regarding xc_cpu_policy_get_msr, should I
also split part of guest_rdmsr and place it in libx86 in order to
fetch the MSRs present in msr_policy?

Thanks, Roger.

