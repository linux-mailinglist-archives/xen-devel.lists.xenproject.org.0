Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F83A271C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 10:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139671.258263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrG74-0007vX-Po; Thu, 10 Jun 2021 08:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139671.258263; Thu, 10 Jun 2021 08:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrG74-0007td-MT; Thu, 10 Jun 2021 08:32:30 +0000
Received: by outflank-mailman (input) for mailman id 139671;
 Thu, 10 Jun 2021 08:32:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5JI=LE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrG72-0007tX-UJ
 for xen-devel@lists.xen.org; Thu, 10 Jun 2021 08:32:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0baeeb6-9019-404c-ba2f-39e620e57642;
 Thu, 10 Jun 2021 08:32:27 +0000 (UTC)
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
X-Inumbo-ID: d0baeeb6-9019-404c-ba2f-39e620e57642
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623313947;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DZYjvCSVjV+s3xLPFinTOyVZZGZtpPehOb6pKmfXD6k=;
  b=T80/ZhIe9uT7ocm+ZIhD2FW7l1B27T5Q+fJw5e7w8k5LSk9lHjU7xB5y
   sGi6Wnsras3e+IIGjndq85qHW7BS5EMMe2vJGivKH5chqWgvTUT5WF/8C
   /kiMHmSrm0hXJBVBsetuqnNrq+QBECOyttQZSagu5zZTWHYtqVvPymO7f
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iK8+YVcPcC63ACzXlTh1AnQIiIZiO1ogszwcwViBMaOyyPobOKgop9hH+TDH6+2svL3voYmdme
 tLOUsVgjYFIlqL4LCGLOW/J4dmkF1NfSpiFUAl86t4QzccR67aIBMQsi/qOf2zs3AluEyTUg/2
 sNxBAN2hsKkmLLtvQC0uoSW1pmEo9smv44FWRqhRxbE0eHg1QsHXbfnx6likw5/85U6P16HTGy
 yOtdoS14Ul1quH4afRsWDa+5fAN2o9eBQUQVCIxdPeYQg9Jrql3H90PnHGM++sGmP2bkivGQ6F
 cz8=
X-SBRS: 5.1
X-MesageID: 47388255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:n1xH866NCcCA4JKldQPXwSOBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ866U
 4kSdkFNDSSNykIsS+Z2njALz9I+rDum8rJ9ISuukuFDzsaDJ2Ihz0JejpzeXcGJjWua6BJca
 Z0qvA33AZJLh8sH7WG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxxr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjz0C3abFuLYO5kLZvuH+8SPw7bWXHAcEcYa
 hT5fjnlbRrmQjwVQGegoEHq+bcLEjaHX+9MwM/U4KuomFrdUtCvjwlLfok7z89HaIGOu15Dt
 v/Q9JVfZF1P4UrhPFGdao8qfXeMB2FffuaChPtHb2gLtBeB07w
X-IronPort-AV: E=Sophos;i="5.83,263,1616472000"; 
   d="scan'208";a="47388255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxII/NPrBZMvKlsJeLI/OYEIkukn2NT4EIBAvnc/MCDlWXAft2807nen7w72wx1QMmF6iHwIGjs6yEgUzPsArYinKndLqCraXtdxUq+kofAJZi3hc80PPMvcA89m9G5mnLJKtO49ziCrGlvTeQosrsP2QfJYm+KoTYRN5/ofqh+nWw6LEBRQYl7et2QUFJJsTbDvBWNJXhVnKy6nHwANVcbSJlmsGcTOsia04XkrBmwC4OdNHTbCN61lfa3ZPL/lchnB35y7e+/aa9cY9jnu4Qw4GNSq9fKmWb1teY1URPA1M/S9hGH/wrOQxSBFt9WR0Golsyr9XznylSu/J4tRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7sciI+MaQ0nI60b66CR3W8s+XfH9h39EKAtUGc0uBM=;
 b=Sf1vRek5h4PsDnx77EfZv6aAph+UWI8wO7F0U++01DyjQaygH4c2y00OTTvmdp3HHR4noyMFLy3VvfvMhFVexTao5eJ0Ycyby+lflp8blNEcIK1aKCdhz8Ii/aqzSB/7tuD9Buq9VoalWtFXiaaPwDnn8ogtMebFRRHWeBfnl0Z8Q8F/jPgpNpmvtNheOetyj404FdyJunxIcmWpH+lkYmyGTn4iNUfPUoNwj8JtcsRVN0qYzpRGLAwEHP9Q4LfJH3DN+lX3pf8aLJHNAM+B7eWezJAEFlKI0T4ZiEOvSMcPGc0dDhg1VoJCpzr7qhJU0kbUP8y+ykHR0lU7kQIaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7sciI+MaQ0nI60b66CR3W8s+XfH9h39EKAtUGc0uBM=;
 b=Lmx94FssPObZPCiTVWRceQaQMTn+cBvQz7/czCgFlCvhwoEfLb+LcNp4teRC09SM/mK5eSAC+gbNetz5PgvyEE64iUeIdtrdRWdQ1Fkps0UK3VhcLPxgIcCVNeu8q6pvMkMnK9oBhRrSndqYDSfUfsPYG8c3aG2N1Shfj03sIpY=
Subject: Re: [oss-security] Xen Security Advisory 375 v3
 (CVE-2021-0089,CVE-2021-26313) - Speculative Code Store Bypass
To: Sven Kieske <S.Kieske@mittwald.de>, "xen-announce@lists.xen.org"
	<xen-announce@lists.xen.org>, "oss-security@lists.openwall.com"
	<oss-security@lists.openwall.com>, "xen-users@lists.xen.org"
	<xen-users@lists.xen.org>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>
CC: "security-team-members@xen.org" <security-team-members@xen.org>
References: <E1lqybO-0000fZ-5i@xenbits.xenproject.org>
 <90160ae63614ca1098c87f5c60002b9a35e922ef.camel@mittwald.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0f39a2b1-9e82-f909-8d5b-4c74ef6b5535@citrix.com>
Date: Thu, 10 Jun 2021 09:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <90160ae63614ca1098c87f5c60002b9a35e922ef.camel@mittwald.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20472282-6dc0-48ad-cd8c-08d92bea43bf
X-MS-TrafficTypeDiagnostic: BYAPR03MB4423:
X-Microsoft-Antispam-PRVS: <BYAPR03MB44239750B3B043DE02EC6844BA359@BYAPR03MB4423.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkgXXx86r+O3Gh5m12hGN+MkeyA8RgHRWo661jHofpGJXE6WywEpKIphHXQg0CCRLyRCUDNkfNZ0UCIDGIatV9LwFL8dbFVgpPRD2y24RkcR1+xj6fjYe+VgMxMEUupo8WN3AaHYNwQ4B32HTVCfkphAA5V4wt0PET4EGVCIABFoUKfRI/eE4tD+hl6KErMMeLZH4BbXKFHul9ud2rH/ND7XZuypLEPIGaVeLem5Go9lGi6YPA4U/VRyGNka9PVrCRwPA1w5C9iPTrbh/uYsP57LpgzGG0MuoXQcj4hd+crQjssUXoRSi7lClvnEu0MUnSqhuKyIaA3Rr3SiKD79E2S1q4rdlz6byStEtPyaWSHUZjpsGiiOncERc0VV09ysl6qbPoowh+VU9nRqgaFUGCwvWfSpFIIrscKOaOW7A6VDxJ1fSI6nDee7rG+/XVpTAWrCTBrkZpVkh8uyjgMJAN9Tka+kwg8Wd+F4WbuzfuziU2lR44LvJhjEdJnlUtvpaZjwsnyYLCFiYAy0SKv9PqBbw5Od4JhDcmHW1J5OfCSLthMGXTnJhf4R8u3b9uQCWc6LasWyMGEWwXqQzhtcMRI+RTJVqoW9mYm8iD/xanCdYPoDRehkbvWFoMOt7cSveemN3WtiE5Ky/M3wgl9nXFuZjAmBgkRD49zid/WNYiC0B+BXnufZQ+I2/OFegycUb224qTjUN1ovBjnt+6FF0QYFkFcTZkDsRBoTSU1zDcMmS2MQCMwsKtOwgabeLHDxLkwxKatgJ4zBjwzlqWcrE9UB8q0YGSGzK72FRUa/KuZEt1bCPejLO7Gp0xzvpC4Gg+pynGFh4B0SMTyHCaJIqlRxTtakCfC1Eu2cZhqb2Is=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(478600001)(2906002)(6666004)(4326008)(16526019)(31686004)(6486002)(36756003)(186003)(66946007)(2616005)(53546011)(5660300002)(26005)(31696002)(86362001)(8936002)(966005)(83380400001)(4744005)(66556008)(66476007)(8676002)(16576012)(316002)(110136005)(38100700002)(15650500001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cERSM2c3SGs1TkQ1MmU4Rks3TmYzaUswZHF6T2xqNjk5dVZjZVNvbTFSQzBI?=
 =?utf-8?B?dDVEdkJJbTBkVVdrSVdXTU94MHhUZnFBUENSSXNVaGkyYjVFY3dnZzd4TUZF?=
 =?utf-8?B?cFVtck9tWmFyNFp3MTB5ZnJGdnliOXQ0NEI3M1YxUHIycUhTMFBhYmlDbmFN?=
 =?utf-8?B?eUJpb0dObkt3RzEvYXFrbkFsVlRhcURzcVJLck1mQTZKZ0syMmpDQnMrR3dC?=
 =?utf-8?B?elJoMDNXaXpMRnFtRHBwYisxdG5GUml6N2ZpWTBVQWwvZEo1MjhTQnpIc3Vu?=
 =?utf-8?B?VDFqaUpwNy91ODNLZ1ZiTHR0TlYwb1hYblpZd3hlSjZ1eGI5SW9XMkQwQWJM?=
 =?utf-8?B?UlVDQmxkQ3hKRVRFTDE0S2lYVk1OdS93RDZLV1k0MkZVeW56VGZZd1VPMjJz?=
 =?utf-8?B?THNVd0lINmlzVE9xTDNHcUNsUjV1eWNWdWFPbk5kR3VCVnRMd1pnb3JtY0tN?=
 =?utf-8?B?TWh3ZXJJUGFKYk9BbmNuVTlZMGJ3aVBaUmRGa3lIVWEzR0c4YlQ1SlZrSUkz?=
 =?utf-8?B?U2ZXd01zUDlSTHNHQ1NRSDduZDV4VmE3bGtUS2p6UGNIelVwM1JTMkZ0b0VF?=
 =?utf-8?B?ZXVLWVN3dUVmdTRuV3BOM0puRFJESS9pRVZxVFBjaHlHd1J3M1Rwakc4OTRn?=
 =?utf-8?B?Q2REM0diY09lZjdoM3RlQzExellHVm5LWHh6Nk5FMVJJK0ZKeWgyaDZvTzFF?=
 =?utf-8?B?UXlFNEF5MkJWQlF0SGY0WStaREpFa1U3RzJpNXJibGVUY1NLMERxMkZOcGY3?=
 =?utf-8?B?MG5EMHAybmVhcSsxME9GV2Nsak55MjJlak16alFERmV6Y2xuSzJBWlBQMHk2?=
 =?utf-8?B?MHFrS0dlQjRTZEdoVmxXNWxCUEo3cWpEWjA3T0ZLQWJLbG5FN1RuWjBiRFp1?=
 =?utf-8?B?eXFqN2lkN2kyYWZnYndmSDQxT1BTK2VGeWdCOS9LWWRNQ1BFWlRNRmhEN0U5?=
 =?utf-8?B?RTVGODg0cFJQTnFoRmh5Tm5Ldm9SaER0MXcvazErc3N2YnYxbWxYem1BQXBZ?=
 =?utf-8?B?eHNKOUhNUFd1R3RwMDl0cVRpYm9jdDUwdkYvZHY2MGdmY01ja1hvaTJEZDQv?=
 =?utf-8?B?OE1nczM4OHZBNlVRTEVuTnBxTjJPdkxFNnNaUWtTT0ZUR011cjZvaURNOVdu?=
 =?utf-8?B?cUdpdkFNMlVRUWxlSzNIQkN6dUtNY2RWY25tZnZDSnRTclFwdlM0eFM2aTlx?=
 =?utf-8?B?TDhWM3pid21FamcxSWpqcVBsUDRYQi8xcktrakJ2dXFSVEE2QlVIaElaUGJj?=
 =?utf-8?B?emxHN2Q2bGpOcm4xOGE4SVUzTGlTVkdZUkx0Zk5KMFFNY0RNNmZsWHpnZXNh?=
 =?utf-8?B?Sms4SEV2UFllV3NwQ2FqbjJyMUwzb3ExU2RiMDJqNEUrOFg0MGNkaXJSblJ4?=
 =?utf-8?B?czNCWldqdmRzRmxWeXh1RFRhS3NzODVwK3QyMy9xbkhTQnpnOWpRT1ZZV2xo?=
 =?utf-8?B?ZW1aMHFIVDNBMWdEaUVIY2xObHhCUnF3bTRidFFmSW9sT0Q3OWN0R0hwWjZZ?=
 =?utf-8?B?aVpXdk4xdzAzZC95ZnlsOTVqTnZLQkN4U0trUEZFL3g3WUxjS1dJRzYxWnpm?=
 =?utf-8?B?VzhndzJpNkJVajlrVUxVMXpuK2daajh5OER6MUVkYkQrUm5SbDlpWUtmRU0w?=
 =?utf-8?B?SDdmZVF4MEZGUDNicVhCeHMreGpvVDFWNVZQLzVGeVBNb1VMRnAzcmJ4V3N4?=
 =?utf-8?B?VW9CWXFicUJKOEE1WDMwcG50azR3aFhxbE5MTjZEVm9xSUw0dm1hUmVSV0My?=
 =?utf-8?Q?DHM9jel4n9OGAnwULgifD0VFO1lQWkMCCu9EhgJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20472282-6dc0-48ad-cd8c-08d92bea43bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 08:32:20.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ci2DujcDDRagq1oknXZ89DVzPs2k4xjTzrUvkQ04Q0WguFR5eXgSC9TgUaZ2BdemFWMTTYkaVDMrc8pAQoeqeTDGQ90XPhJh9X3PkhePHhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4423
X-OriginatorOrg: citrix.com

On 10/06/2021 09:04, Sven Kieske wrote:
> On Mi, 2021-06-09 at 13:50 +0000, Xen.org security team wrote:
>> For more details, see:
> [..]
>>   https://www.amd.com/en/corporate-product-security-bulletin-amd-sb-1003
> The above link turns into a "Page not found", at least for me, I believe the correct link is:
>
> https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-1003

Ah - the link changed, and I thought I'd fixed it.  Clearly not.

Thanks - I'll issue a correction to the XSA.

~Andrew

