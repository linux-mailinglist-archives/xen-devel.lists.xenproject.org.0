Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585F3B45F3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 16:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147275.271344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwn0Q-00085m-6D; Fri, 25 Jun 2021 14:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147275.271344; Fri, 25 Jun 2021 14:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwn0Q-00082i-1S; Fri, 25 Jun 2021 14:40:30 +0000
Received: by outflank-mailman (input) for mailman id 147275;
 Fri, 25 Jun 2021 14:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwn0O-00082c-5K
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 14:40:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb0ef7d0-f7cd-4f9a-aebc-376269e0fb0d;
 Fri, 25 Jun 2021 14:40:27 +0000 (UTC)
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
X-Inumbo-ID: fb0ef7d0-f7cd-4f9a-aebc-376269e0fb0d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624632026;
  h=to:references:from:subject:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3fg+T3wQESKfJGdYL+eqMYIoGGhS8RF+YpoeMOdfqx8=;
  b=Cn6G9YZXZRFY/b0iXzgAHPKFDq32QXgA7DK1nIUPUlllc3Rn0Oa9WBQX
   g6pERZuwvZwrZzYIRwGrwyQinWlv3BtImPXrD6AUruWaRmLDB70V9BWK6
   eUXwriHloxQbjXjhvHj+7W6vT2Xcf0H91qXG6YgG1T9HLstiD5EDlqCvh
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EhOP+MBER2kbov95TgiJ/EGc6Yz3+rSEztqUt1z5amvRZsBlZWUcpkl2GIcqIOO6mc488RGR1d
 +NjRFIjNeW7dx4RhwKuotnJ1dap8AYwpkDI7CPgHsG6NCZK4ffLFQ55fJpR2C4Gf976TofzLZK
 N1+MGFKLE7EAy9jer6d+oYPZJAoeQhNtD4HIhe1XckkXa2266PzB20Gdo0sWPRUS9gavu5c+Zg
 VIBvNGPl05KicUQIBh+mLyAMV/WxWCf9fAHipyEMqNnI2rY0zqI8NE8/w7XPkfmnRyiu3ZjWR2
 tX4=
X-SBRS: 5.1
X-MesageID: 47351189
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QyTLRKFgvBBzk8hQpLqFlpLXdLJyesId70hD6qkvc20wTiXIrb
 HKoB1E726XtN9IYgBSpTnyAtjzfZq8z+8x3WB1B93SOzUO11HYU72KgbGSuwEIXheOhtK1tp
 0QN5SWaueAc2SS5PySiGLUf7hAoKjlgcbY/Ns2jU0dPD2CAJsQlTuRfzzrbnGeMzM2eKbReq
 DsnfauLlGbFkj+4KyAdyk4tzSqnaybqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+KemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aeSARcR4Y
 DxSiUbTp9OAkDqDzuISNzWqlTdOQMVmiffIJmj8CfeSILCNW0H4oF69Pdkm1Pimj4dVZdHof
 x29lPcjoFQCxzYmiT7+pznazFG/3DE80YKoKorlHpYXpIZaLhN6aol3G0QPqshMUvBmdMa+M
 8HNrCJ2B+TSyLOU5mRhBgZ/PW8Gns0BRuIWU4Ep4ic1CVXhmlwyw8CyNUYhWpozuN9d3Bo3Z
 WKDk1TrsABcibWV9M2OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI75r6+q886u2mcIEBiMJaou
 WDbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidSeDVFctmc29pOh3OLyaZx
 9yAuMbPxbHFxqtJW9k5Xy3Z3BiEwhSbCROgKdzZ7unmLOBFmTFjJ2sTMru
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="47351189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBLE60/EEob1QMJi5m/pIzZOj0iimic8HusuHXjdG3Si3vdTy1cA1trExXVuFgoWLfCVtrduOXEBiyRHmc5No8mdpO0sMpHiqveG/iLPS3JyZIp+THFXO8L1hM9B6lein8TiAHQN1cZ5tuy/C3p0Uix4JibrT1hHINlDhL1X0GcWrLUSN8Og5848xH75p9+AenXF+sweSSUW74PtO+tNkALly0f93swZy3CmWs3WV91IAvUzJw3C+j/9gd3UUdCvXFdyMD6QsFBzVqkX2ZcLcLI1WMlOuAf6Zmg1E1AJN7hATGX/v/D+uiR5inxIAsmQKsrhAL+HcbSjTvblWjssAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVCJMt0Nbw3/93DJI1GSWfYreC82364GaYfRJbO5u5Q=;
 b=UoA4zhmo4GBWEnEYcSfbzPKMKjwztb3h+pyoj0hcjivYVnKPJXHUhW8unbc1SIWBV2kgqV5RhrGZFRSc0WxVhhqaBYLu64Eqh55moFIXa/k6ZMW0f2JaBW6+5kgv3lQKhxMB4eQYs/hVCgvdpp0JjxdYP03pxnlqt4PEsfJB98Tg/sPdFEZCHXk6aKRcdcgc7fQhX21/uWsNsdRkNf9MFgh8pBxftd9DoRB9CbBj6Iqpdb3bcoP4ekhDJMDZTkrZG6KgFnuHNsxTgcPurdiOQ7QzUbRiAeEKcMApVCKqLqnNKyJDX/DenQ9RGqoUvRL8wEEe/CzMq8xTEta8pL5Awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVCJMt0Nbw3/93DJI1GSWfYreC82364GaYfRJbO5u5Q=;
 b=XWnKORPuwbCP3Xaj8X1CfSodS2LyRNQy+zaXcWeOQ8mVqi73t77TLf2URy/sttjM2qPdJ9Ed476jE1GdP9RuXkAO3GsqmBlnCJLRmwBMR2blPjp2UjyAkLWDHUYWZ8IDJN2GU/el/sptnVVyChE6JVIJgRGl9Dh9jvw1BinO5bM=
To: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-163021-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [xen-unstable test] 163021: regressions - FAIL
Message-ID: <4257506e-41d4-3d04-a7c5-b33d5f356560@citrix.com>
Date: Fri, 25 Jun 2021 15:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <osstest-163021-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e20a7c3-29d8-46b4-51fc-08d937e7257a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4615BF805E3BE301071D075ABA069@BYAPR03MB4615.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0e5p6uTnhxPd6qpvCEmHU5v2/MWfA4kAtH7mhLT6dikdpVAM5nqftgh/I10Pa2nDUy3iOuIQmt7/PV3N4mb9GtXLy32tXE8YLCfSDbqVJdExZSNMaL4FVArc9sGySiRFGn9CUGPKzQ8MO8DmQk3h3K1Q59IsWMzuPKgFWmipQ6t6OGRvLYuopI4l5duKy7IUts6gXp6G2aeenMJnoCwlnACtAcuhPW3AWmaA2gFPJcMvBoPkoqRWtC2thxGywwJdZSMPFpmF8H2Wl7QY4WePWUPbqm2mEC9RxvCMXIuNq5vmOEkintLyeVGG8PJlF+EeTfeZLSCorGrhLVDcRTMXHLw9dXgz1AGj/5hyMPlmT5HMiovq/VeqqBL4vxXDjBSWwaDOUJOdDdjxaS6wQM8QC9YyjWMJW31sf4gqXTlCcWp9rtGJ3pI2FjJUt04aZKMzAsFmQAs3x3q6LqtnHTWxQEXLvLXVJGsiVhEJi5BSlZpZbJCbhJrFhckDR4BQ8zJNkp4FPeGoVNllYiGRU+Cd7op1/GNUMTkfuvc6k8L9euBlbg00/C1olFFidqyEiFPrp5AAgR7RxS3W+xrIyugqjeVqRMveG7sEJyICpmcKSv0ovGYABdlRx5L6LFnzBTY3A+CDcZanUYb4N3aNOZ68amq2pglNK7O6i8hJEqpHrIbeWE69Me7eC3Os7oklCuHfa3Ak4UCJDNnODAFYoXHfqPDtWLTKtIs83KMfuLRFAjx48OdYK1CNo5ThzlJKSwGBjzXQbjR/lDsd2auTPTIy9hYHBo19xYhGQkNRXblMBs+4I+OxXahTps6KCWtUvz8ur9nsEsCtCX3j8o7OEPzOPa+mj6McGhOjaIi06+70pq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(6486002)(2616005)(8676002)(8936002)(26005)(4744005)(956004)(53546011)(186003)(110136005)(5660300002)(16526019)(36756003)(6666004)(16576012)(316002)(38100700002)(86362001)(6636002)(83380400001)(31686004)(478600001)(31696002)(66556008)(966005)(2906002)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZ1WVJVaHUvenNUOXBZU1JDL2JIcDd5TWR2YmJCSjcvZjlCWkN1NUJybzF4?=
 =?utf-8?B?SmxwOUEwbmxTcE1raFNqNVdHcUJGTlF4Q0pHQlo3d1NaMG5pMEkyVVE1a3BE?=
 =?utf-8?B?eDBxM1dYdFhEamsrNnJCYm53cCszWHdCQW9HSy83aytrakJ3aEhSV3daNFUx?=
 =?utf-8?B?SmQvYW1IYXBqNUxyQXM4eHFYMWczVGcrUDc3SExJZWEzRklqVXVHVFdCclV1?=
 =?utf-8?B?RWRXWGRmTDVXckwvY2RLUEJWY1NJQ0Y2S0VlTFB3RTBYS2RSeDdTL0VrRFF1?=
 =?utf-8?B?N0NUalNnRFN4QVFHN1ZWdExVZW9PWFlDaks5UGpyWnZqTnlZUmwwMnpGY3NU?=
 =?utf-8?B?dHJlamlMbm1YSDN1ZVpDcFRQeEFiQmdmakNJQUF6UmhvR21mdzZxeHErcWNM?=
 =?utf-8?B?bVJiSXM1L2JjeUNPMXc0dG1hTWV6d2dEb2hBcWFxaFJqRDNtRlNBR2JORVhO?=
 =?utf-8?B?Wjd5eTFYZExHY2QwYnlYd1h4YVdBemxrY1lvMUZXeDYxWnhWUTV3Q1ZRd3RC?=
 =?utf-8?B?VUdZMENBWkVKay9teTFldU45V01YYklDWDh3SktPZ25ZWEFreXhBTDJwYTZI?=
 =?utf-8?B?SXBBazVqNFRJcUhRQ1kyOE1maXhEMzJMYVBzSXUzNkNoMWVoZ2REZ0RuR0Fi?=
 =?utf-8?B?S1dYN3BkYlZ6Qk5COCsvOXYySXh4WHNFc0VRTE9FR1JxdjVxNlVjM2Q4eGty?=
 =?utf-8?B?c0d6bFpNeUVOOG12ZitkeEJGdnJLWmdBbXVJMG9XYnUxSzZyUktvSzFCU2Vz?=
 =?utf-8?B?NEd0STJ0aFhXdmdub0VlYnJGWS9McXJtQzY1dERiNGRsNWlQNnVMWUZyZ081?=
 =?utf-8?B?WER4VllUOU94cC9TWHNBdms0M2NOcGpDY1VkY3hkUVZhbWM3aXpCRWdwOUti?=
 =?utf-8?B?YWVtb0ZIVnp1OVlKVFUvK21SNW84WVhIbUF5MWFjR0J0U0ZMMFhyYVpOc2RE?=
 =?utf-8?B?TzJhNUVVL2pmNmxpeDJiTG9xdTlPRExpaitTb0NKVCs4WERscmhpaU9iK0Yv?=
 =?utf-8?B?aG8vY2dlN1JycFkwUXp6MlpCVU5FaTlqc3lLcGhaWll0eGpXVVR4bHRjUmla?=
 =?utf-8?B?MExvNlpjaURGZTJRM0xSTDNwUHFHd3gvOGR2K0pOQlA5V0p3dHJyMng0WnRL?=
 =?utf-8?B?SjRNUkRjQmNEOStpdnJ1OXpSSmdyL0RvUjZBVWxGODBMM0ZaU3ZJNU5zQkla?=
 =?utf-8?B?dnQyQmhWWkpnVFBsdEdVUTN0VE4wSWZpb2pCK3QxOXE0YXVtQUthVThlbUpF?=
 =?utf-8?B?eS9pS3JhNGY4NmREcWVYUGtrSEV4dTREaVRiS0NqUE9uUmNPTG8zRmtrN0E2?=
 =?utf-8?B?RGgyRkNJQlpvekhSL2lUenBLMnhWa2VzNSt2Y203SGt1c1MwUXNoUW1VVHo3?=
 =?utf-8?B?V2I3em1KYjBqa2tRMDB5WUhUSlJuN21XNFptdU4ydHNYYjkxWlpYV3dWK2ZT?=
 =?utf-8?B?QUkzRkJESk9JUzBKVEp3Zmdnd0hYTktLRnh2WmYyR3lEbjZ3V1Jpb0pEZWk4?=
 =?utf-8?B?dHdkSnoxVTRkUlEzNGJyRUtEYlNZV2pvaUtQSjZESHh6SFBVVkNxcE00R3Qz?=
 =?utf-8?B?ekd4bVZtRUdBZVpqd3d1ZXhuWEpxRVl3ajJjY3Z1ZWFuRkQ1UVZ1dHdvbjBm?=
 =?utf-8?B?dytRb2NxYnhpRU9rZlhIQjkvRE1xZGpmMkRCT0NkTTZTR0NEOFRlZnBjZ21X?=
 =?utf-8?B?WlYza29MWHdzdGUzOWtDOFVmUHJmK3BQRm96N004azR3RFZLUmtLRzhPcnZy?=
 =?utf-8?Q?GoWH8FfCez7Cf+u3XTDCmi3A7kedw/pmcGIlmh4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e20a7c3-29d8-46b4-51fc-08d937e7257a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 14:40:15.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjVtXsUiw+3LAK3ztcZHTFpdhX8lPXOOVO7PCWWiPevyiKUR/uhXZTb1t2UVFx/LjVaP19JjyMTPpp125HYqJGUM2tEnjQwope1lmPtSgp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4615
X-OriginatorOrg: citrix.com

On 25/06/2021 10:43, osstest service owner wrote:
> flight 163021 xen-unstable real [real]
> flight 163030 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/163021/
> http://logs.test-lab.xenproject.org/osstest/logs/163030/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. =
163014

This looks like an OSSTest bug.

Immediately before rebooting, the PXE config is modified, and all
subsequent boot attempts find no suitable targets, until the next
flight/job/etc starts and writes a new PXE config.

~Andrew


