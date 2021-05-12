Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1137C0B9
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 16:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126271.237693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqDu-00039g-3r; Wed, 12 May 2021 14:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126271.237693; Wed, 12 May 2021 14:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqDt-00036s-Uk; Wed, 12 May 2021 14:52:29 +0000
Received: by outflank-mailman (input) for mailman id 126271;
 Wed, 12 May 2021 14:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XikZ=KH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgqDr-00036l-Vt
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 14:52:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8404d95-0236-4e77-ab24-f67484f37af0;
 Wed, 12 May 2021 14:52:26 +0000 (UTC)
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
X-Inumbo-ID: f8404d95-0236-4e77-ab24-f67484f37af0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620831146;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tOUc4EMZYhTBpBf+owUFWUgGkCYuXMNlStJ2eudHJUE=;
  b=J69yRGdoUxPEfz+6yoRZzKeZBUOlHm7aifaZAHCi1XGCamPCs8LcpCnc
   cpPRO3iW4fIzF1wZwklAsS39OK6/XCEM9S7avSt2yGGbweIb0zz05QVdn
   S/I0Ztd6mBg9yLYWC7JLOopIv52HVE/yGuRqoZgZdJscwJdyy0d7wQFUH
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EoVt/jgZab7rgEc7f7JAIbMXa+2HuGcuqPidxvxcT1rWuzhSEqtRNOf/t4EGVLguBewnKXAPsN
 r13h8oD8Jq1gcjHwPPT3icKwgHF0YwAhEOET7AwQc6niXtkzY7MpjyUm+CZkvA1/8CVhVQONZm
 k2Gax+2fhKEBLV7/chw8qlAvgHnStAwO6qcE5VDFC4oaAHvZ4VH19D/c7UlGUoxmrZ24wz1oDt
 Kr6frPLxgETp+53X4ITBVzjyJ5Jx1+1qLgvmUfUZjjUOikj/APBpQyFKwnEfkpr4vdTA7gwmZF
 e6U=
X-SBRS: 5.1
X-MesageID: 43435481
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:y2Nh6ao+ZH9qoFnUN8Z93gkaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="43435481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/QopO/vDUzOr9L5Uuq7Ro1DEeKkcWQyN4S5327s9FIO6bWQs4Qe9e8zTLrPWnh2Uw5R6CTU/eIwEAHiGdKSEqc8nbGH6HDzsMLwsgfD0VPXTN0LPzWlaGHtC045ENf+8NpQidNeQ4KZUuB+3y2pFPiaSfRMACkzH+jd2GSv9OFB7qeTBgk63zt391MgkAio6wTp7G2hU7w+rTl45RXCnwXX/S5U0ltrM4sU7nmbtmbReGqah5nrE/bwpRb1KlhtoDA/sbP7TTkXdG7RnBjFfzKfA3kf0LhlTPXWIRr+tz34zQR0rRzSSLWxNeO3mPNoy6U0kiNUNNu6DOU3Zo4Pmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOUc4EMZYhTBpBf+owUFWUgGkCYuXMNlStJ2eudHJUE=;
 b=VBU2jhp00e5xfN5WCIiuOhCgV/svfgtP3VQoGqJR2kBC7KhcNpeMbHh8js+EmCvJ0Qc1q93UFPAkuTAm2qdDiIvkMuMMmCV9yfeyqnGJ0nzkn5N59dUeasIuw/YEzx7CFeCdHgmuc0v0894LOJc9xaBrC2RLu1M+RqDcUQfyM5+7N3zGp9J+t1jQ1dxjPg3ugsn3ofwD4ntpWO5F3Sx9KAuPD2AKDuZxg2KAkcL74muuYLhofrE7YMNOQ4fGf8eTXvGMASuoaj7TiRUzZENQPD684qNMNL8a1EgRmHjYLT4TF5uopWmXVab3gf7Nbz1MR6/Nctb5uLRTicyDtTiuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOUc4EMZYhTBpBf+owUFWUgGkCYuXMNlStJ2eudHJUE=;
 b=eDU42Isb9QiubYye0olmJyS6iAjP8JzBvBuDVLz/XXFk+KzD300QgCE6sc0lUpshoB8IqDTk1upT+L14VJkQXX3dfSEpFoByAZGNKR4zNA1G/FO2BIOxHBImFjkSImSNwj5Wtrf6nzBeF5OHLFq+2Sw/1G/b8qEuLUKEGoERuOY=
Subject: Re: [PATCH v2] tools: remove unused sysconfig variable
 XENSTORED_ROOTDIR
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210506151631.1227-1-olaf@aepfle.de>
 <a236f079-1771-7808-bb16-97b9dc5ed733@citrix.com>
Message-ID: <fe7ccfe8-967e-ed12-5804-590fd9663608@citrix.com>
Date: Wed, 12 May 2021 15:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a236f079-1771-7808-bb16-97b9dc5ed733@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43b7c87-728d-4657-d3fd-08d915558cbc
X-MS-TrafficTypeDiagnostic: BYAPR03MB3431:
X-Microsoft-Antispam-PRVS: <BYAPR03MB343107C154917854BFC00FADBA529@BYAPR03MB3431.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENMDJJPCRGjaoH3J5QMKPmts1+Ks0Pglch+82x3mvJTHgpUbSbfV4qgcS7C6fQVdiW1ASUsrrf3seTv3x+ddoi/S+7Q4CpM2NFexWlhxFGUOp2w7TS9Y2QNlMW/t496dsWOUY9chuEEFSruRoUfl729qTrr84rCdBGxfYnMDhI5PaIi1UR6qy5aCjgMzdTLs+DAG8l03nodzBIz+Yez0TMvbDTRqXQIHxsOk12Dqu9shdbe4hzQLUcGdQ8b/2HhK3hCnZHEo1LV9wdPYqBM1ma9EihjSFg7vVhTeF6KSfOnmuoi80a9L0mwOznXUomSYTN5sJXw/A2BVqJFUTZhEdn+gP7DtiRyuNjSzqoth9Hbfo6R/wDe7UqKDxkA4GYXw8Ul1/2WlwKCzFS2V6NS5rZXGbjRjvgBFe4L7s34etJg1/e4OO9mdkGyzvrUviPsgP8zsTemtF7T88P5oWZQKHQZ39tcxRzSQKYh8SMsq06ZWRsbJhgUtns1nNFU2465V+m5grWsLLKIp/v5iaMADizwRG5gb+lHhaS7XHq97467pPh2B0FMndZ1/LgcVbu5P1dvnUKKgFQkaVqDziF91ad+xoLOIaJopJHzq+RuQFSvfIqC4JynUDKxZnwLkag6cv0oeeFkX3frsIbQu84o1ktnCEcm/QFUqDw6DxnZhxFrhkEq3qNMtnBJz3CVEMcno+zLk+ygy9Xu/YBjOONtqr39AWW/8e1Xc80XH5PYMg3uecix1/jw1JmJJeYsD6lYHJ9AItwoWPA0yG3NXexRStaJO0wIPfEuwbt19Bd9zX4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(346002)(136003)(38100700002)(4326008)(2616005)(16526019)(66946007)(956004)(31696002)(6666004)(2906002)(31686004)(5660300002)(53546011)(83380400001)(86362001)(6486002)(478600001)(8936002)(66476007)(54906003)(66556008)(26005)(186003)(16576012)(36756003)(316002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TFErVXZMNDFKcHE5RDgvOWQreG9VV1djUC9lNmtJeXdkaGVhUkNVdUpid3Vx?=
 =?utf-8?B?cVMvTUpIblAvN2JKenVXb0l5MFlJcktTTmFOZ0ttZStiSnYyWEVrVFFFa3Fu?=
 =?utf-8?B?TktQSWpnWHBUS0NkVlNvWkgrV2ozMDRUUzBOTU9RWGpobnNBdWlBaThkUlhj?=
 =?utf-8?B?d3BNd2ZZTjJPVG9Na2VTdC9sNEFURDdRZm9mdmNUdlU5V0ZKei9keE9jblFW?=
 =?utf-8?B?QnZLMlhiZnZTZ3EyR2hRZTVEcFJGNUZwREU1aDFHZHpLdmN2cDNXVm1OL09O?=
 =?utf-8?B?TWJSMi9COGJDUVFlVHFPVzVvZXVSYmVtaitGK21OWW5DRmN5VmY1d2I5dGF4?=
 =?utf-8?B?cEtRR3F2cEVoUVVsSE1aQTFhYVFOcTF6NklvczhMY2VvQkNpQVIyNWJGUSs1?=
 =?utf-8?B?QXZycnJieWN2RCtWMVM3MmxpR0lWN003Mk9hRURZM3BvWENWVjU3Zm85a2dD?=
 =?utf-8?B?VkNmRWZxWWpiMkxMbnVLaXhBOTIzcDdCNHJTUW1OVDZtNFdmTnRBZFpxYnc4?=
 =?utf-8?B?VHhMNnpadHNnc3RLQlpBRFhrMytTZ0JRS0FFc3BEaWVnektRSGhPYlhhUVMw?=
 =?utf-8?B?aTVHQzl1N2U3RmVXOEhCZnMxRFhHYUZWd0VNb1lTMFAwcTNpdngrL0JNNG0v?=
 =?utf-8?B?azRmZFhuVzFqa1l5Q3dTbkQvYUxVMmZnaGcrZHBoVndFV2RhcUMxQmFHOGx5?=
 =?utf-8?B?Q0toeHNiczNkMzQ1bURBRXFjS3FSb0N4ZzZLM1RTSWFIM1hxd0VtWWNXN2JW?=
 =?utf-8?B?amVwRklYcXBsdWl4UkpWclRlWXpxeU1wMXFISGJnUU1ZSFAwclRvMlpqd0xy?=
 =?utf-8?B?Y3VjN3U1elFjMVg4UkxtOFdiUkVhWlJ4US9ObzB4K0VCM1hHOWJ5U1JXaWND?=
 =?utf-8?B?TkhzT3F1bE03eGNteHdabkdHRW5oaitscXI2UUxFZ21SMnhGS3pkNnhFL3ZR?=
 =?utf-8?B?eWFLdGMxWjI3WHBhRlJlVEhValptVW14RUJUNjIrT00zQi9oeXZmYjBZbkta?=
 =?utf-8?B?QzJOM2xkeWljSVhab21rQ1lKbWt4WnlGYmJUTDNJRlBvR0UwaG1yQlUrbGNx?=
 =?utf-8?B?Z0JlWkU3bGdTY05wZFFkZy9rN0l5QWtxakJpN2JZUHdDNVNHMFFjZjNCQU1z?=
 =?utf-8?B?L2VoQTQ4T01udE8vMGNDZHVVQ2dDakw5OUxmU3FKYlRBNy9vOWY0OTd0VUNy?=
 =?utf-8?B?MitOQ0pLM3JhM2FFZ1ZQd0ZvQTNBeDRUcWpZcVVkTnJXbTE0WUM1eStFOW5k?=
 =?utf-8?B?Z3A0dlgrWDRXUlgzRSs1S3FuWFlzMURJY2VDSlBHaVhyQ2w3NDZWUk9tV2hM?=
 =?utf-8?B?VG1sREZ2TjlkQ3E1T0dRSDdnZlR1OWx0RDRDRDRuQjJScmVVTFJKa2NSSVht?=
 =?utf-8?B?QjQ1SHVCZWFGNUhjOUQyb2ZDSjVhSEEwUVYrdXg0cDBndTlheGZSRytwS0dp?=
 =?utf-8?B?OVFiZU8vbzFBVGRkRmtzT2pJQ1doaVJYL0F2aG1kR2lxL3VUNkVkbFVseE1K?=
 =?utf-8?B?V1BvRGZzRFVLQ09rTUY5U3o2WVpCeWVZZnZTRnFNR0FscVA4c3JlZy9ZaW5J?=
 =?utf-8?B?dVhFM2JKaFY1Q0xHMEtIRW5PZWtPVFNJSk13RGZaOTdnY1I2ZXlwL3EyOWlG?=
 =?utf-8?B?ajVlcVhFbjZ3dDJXRG1KNXNQTlV6aFpDdVZEanFsZmhKdkpGR3EwUWJEaFZ6?=
 =?utf-8?B?cklaZVg3UmtwUzFyMGNnL1o2UHkrSUtLcExRcjJrVktsSnR2VUZCT0dzVGl2?=
 =?utf-8?Q?1hgnAEqSx4WmlweT1c8ykgemZqqF9tVCWh4M0xW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b43b7c87-728d-4657-d3fd-08d915558cbc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:52:23.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNBHSg5XqceSxcHWAqMFrm6XTitQHPKeUDqZW4aEXNn38UfflITS06Y1Q0Bt8AId2cNFhToJ6atKdoW1yUGo87ONOdYjVS+FxJWP9J0hU3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3431
X-OriginatorOrg: citrix.com

On 06/05/2021 17:49, Andrew Cooper wrote:
> On 06/05/2021 16:16, Olaf Hering wrote:
>> The sysconfig variable XENSTORED_ROOTDIR is not used anymore.
>> It used to point to a directory with tdb files, which is now a tmpfs.
>>
>> In case the database is not in tmpfs, like on sysv and BSD systems,
>> xenstored will truncate existing database files during start.
>>
>> Fixes commit 2ef6ace428dec4795b8b0a67fff6949e817013de
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Acked-by Andrew Cooper <andrew.cooper3@citrix.com>, although as we're
> trying to keep on top of the changelog this time around, we probably
> want the following hunk:
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 0106fccec1..6896d70757 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,10 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [unstable
> UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
> - TBD
>  
> +### Removed
> + - XENSTORED_ROOTDIR environment variable from configuration files and
> +   initscripts, due to being unused.
> +
>  ## [4.15.0
> UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0)
> - TBD
>  
>  ### Added / support upgraded
>
> ~Andrew

Olaf: View on the above?

~Andrew

