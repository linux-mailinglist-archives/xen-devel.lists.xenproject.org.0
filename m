Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270293C235B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 14:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153621.283797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pT7-0007Nz-E1; Fri, 09 Jul 2021 12:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153621.283797; Fri, 09 Jul 2021 12:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1pT7-0007LG-B0; Fri, 09 Jul 2021 12:18:57 +0000
Received: by outflank-mailman (input) for mailman id 153621;
 Fri, 09 Jul 2021 12:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iqbd=MB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1pT6-0007LA-9F
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 12:18:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3dfab28-e0af-11eb-85e4-12813bfff9fa;
 Fri, 09 Jul 2021 12:18:55 +0000 (UTC)
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
X-Inumbo-ID: d3dfab28-e0af-11eb-85e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625833134;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KLV3x48Y1E72VtdNOqBWc2ImaKcR2HFSWrxL7+3qHUo=;
  b=KaCGQFbxtzrThkc/519lOCO2XZxO01lTb9FjAfCWcWCP2nRZ7eUUUymv
   fYLkbU7cKICnW5AbydW8KyJr++EnJThNn6+B59888OCXn3G/mOWQFKrcj
   dszTZu/Pa28tla2zRD3oqWPKwpprcu6xsQ0YWY/2RYGg6tZt5pvpT6r1a
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0d+b3mhVWEHcIG74RbA+ql/hPpNw9TdLvd3oAAwDsMlzNYDYa/piUNymevdJV3YW5G4ZYWxN/F
 gBA6iWR6CLfs9e45L4wvGgdBIKwbXRQjv/MKhW3NSwHBkvsvXb39AUXnDFnyFG5e7c3z4Nj19X
 IMThT1v3Mj1GoSWgwxxWuV/VCb/XZ/a6oYqwr9SkLxhiQG6SWV/FWOYTziC2rBccgN9PL924Xk
 /fcehD9331m3gL5NwIPCR36UYrssZUiEunQmzNcQRsdKUP9H54qPVS0zzqEMiLXICVfcDTeKQ6
 dmk=
X-SBRS: 5.1
X-MesageID: 47931100
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/J4S/6v2skC6W4AvnrZn66lP7skDYdV00zEX/kB9WHVpm62j9/
 xG885w6faZslsssRIb+OxoWpPufZq0z/ccirX5Vo3NYOCJggeVBbAnw6On/ibpHDf3/PNc06
 BpdsFFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47931100"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfK3+JShXVHf7Q6teknmeB2xaYLJzi3rpnx63lQhxBRF1VqEj/ehfz5yw3eb8jC66kCLV7PkkSE9TvJvo6J02k3WYGCG0xuJv3PRLxfNELEnmxIy+mJUAwf8giDRzy7gklLaFa551b0wOzeaV6FPATKOmMbbGU8rjft6e8Lp/MB9mS1fOLe0VC6tWG9iu12OSu7z2bWy5hrigRK3NX30wNwVsI3RtSGPkszgPVRhDmSlOGhhnrpiL2tIp8fZ7+89YqvspJLlD8dYf4TRfNKAxGCGDif0sxdfppalTJbliYOuXczCz1usogagowupbaRog8uKWtZB8QFIEDEzgZ6mAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLV3x48Y1E72VtdNOqBWc2ImaKcR2HFSWrxL7+3qHUo=;
 b=S44kOE/9ZADACH81w7vfhe5TM2XD+Yy+5W/LnGNn+6CAYZjwtYqnrKon1Vs57bMtWjwZMyRFhuQf7q1bvJyoyKHrOfMUBoyDaGFOdhAfppZzsSrXSut9pjVbp5OvZvlhITnPAGyDSJAWkcvX3RI0X+ep1QO9KK8drglzK5xWEMILIC6E5z1DjR+kLD8I9adI8PHgpP4luqD3ZGwonF4yBRU6jMw+I22wrEsPr8Dg80sqgnWzOjiHm3KYvTjcPSROb6RlvdlfpLFuwAlZdgiciGgO36+0vKTXZoH8WWCRZACbhOcHRSKUvzl8lrPJnTUYX6JRe2ee6BvLk7/O7vBwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLV3x48Y1E72VtdNOqBWc2ImaKcR2HFSWrxL7+3qHUo=;
 b=sp8dPG2HBVX4NzvtL6smt3iKqee8x9UeP28JSN+y2yZn7NxDch/MmeYtadEAk/CJCHGJvI664mmzMaa4k4X5bTU3AL1yfe3an7MzrNdzbMOUkOWkmU5jpPQPxb/DQbzVGcA3DTnXBGcPYJ+xrlnplwNS1TueYk/laBv1jtgFQ+I=
Subject: xenstat-exporter: [Was Re: fix vbd rd_sects stat]
To: Richard Kojedzinszky <richard@kojedz.in>
CC: <xen-devel@lists.xenproject.org>, <community.manager@xenproject.org>
References: <585c34fd96c6e22847333d9d18843c0f@kojedz.in>
 <522642c6-6ad9-28d4-469e-53583441287e@citrix.com>
 <61970531-A990-44B4-8614-320141E7C2D7@kojedz.in>
 <4cb7a1b3-00ce-5866-12b5-a7df8f7a878a@citrix.com>
 <5fa286cab6fa4612547862040729a9ab@kojedz.in>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <73cc89bc-a746-6fb7-2535-08c85221bb89@citrix.com>
Date: Fri, 9 Jul 2021 13:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5fa286cab6fa4612547862040729a9ab@kojedz.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0319.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e013cfc3-6267-4865-1690-08d942d3b629
X-MS-TrafficTypeDiagnostic: BN8PR03MB4707:
X-Microsoft-Antispam-PRVS: <BN8PR03MB4707329A78BC14F5C68DF847BA189@BN8PR03MB4707.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32/e8lMsn6MBL9k5qxGAKzhspK1tCo0CkZEHluq2qz9d/qkTzHOoxkzB59V8Cu5Gc1uLpaydup8Um+XZLGvxRgzufdFi3FhBl80fmkjYd1TpK9ANgrTm2VKqZdOk/3JHHQUQvTi+HtBg80QFXXx5HtDygg0fYzuW1EDiiYY+CpWQktGBJV4RnQBPRWaH+AsD5N8eC4559kNOak23hEAcy9qlwo7DYYz92zCDp1sa8OV+YqU4mR7okmMCoL2MEyq0BfLL1vriYHXvOUCIYsoJ5y73fQyYS4zqDSOAaMyyyN/ykSIQFrFvMPiJI/0Lca3GeH3EcVngRuWb+bY+d58Q9pAVSsANXsxrYNIjSEm8+E9koul6l9QbItvT3jYpeGr7KgeKzNSlYg/E2m31xHc2E9+to7pxoMN6FOJ0J3FDmdFWhlef7P9csxuhBLZyWr/QMvE2EZCOFBkzMF0cWaYD/+pOia9+fkioOKINyt5LbOXYNM9agqbZcC+J18Nco+GaVK/1BpnueyBymYgI0JkjO3MUuSKaG7YLYQSsJUVzERgDn+RXpwkNfTCx+pC9MSZZrhR85E6ajHj0iEFzU7vRNlu/m3hd8rgE1MGoEmlSIHWOQEyAJd4ath/Eo/v79UgzU+y0jqaNFxadmFar74dApW953v9NRxOLT7lSEIzcAq0aChtKxCY8QBZjmqeLSd0Tlwzy0ZNCVQWJh6fnA5mP5+aqHiACq/s32p5X3v7XJYFpOpwEQI355mjbIPQKt8yNozQxQAWOXa3b9QhmXN1Op/6REerxdSD2q0jFm9iyrSrVf1ILWWZ0wRbGdiRbKNuc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(6666004)(956004)(83380400001)(2616005)(38100700002)(86362001)(31696002)(6486002)(186003)(2906002)(316002)(8936002)(16576012)(53546011)(31686004)(4744005)(8676002)(26005)(66946007)(966005)(36756003)(478600001)(5660300002)(66556008)(66476007)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVhJTFBPQkVacTB6TUhTd0I1WjhkdXc0SGNndmE2dHZZdTNSUDJHZHk2QytK?=
 =?utf-8?B?eFc5NXF1NmdodUZoNXZQWDdKY1dqSHcySURRSllKZ0N5Ukx0MmZHbE14eWw2?=
 =?utf-8?B?dmxBMFVsT1J4UXlHcDBybWgrSCtPTmhhVGNSQTR4c2RlUkFpSVBVTnhDQmE5?=
 =?utf-8?B?QjZHejNOTUYvNnpLOE5tZ0c2d1dLTVlyMWdBaHdsS1JXOCtGUFJ3ZUNWNCtu?=
 =?utf-8?B?eTYvL1k2TTZMVVA4aUt3bnJWcGVaelRDVURVUmxkcmgwNjY1cEY2Z1h2UUxC?=
 =?utf-8?B?YlN0NmRwYzZkTVhZYWMySTBBclRCUUNQYWpaVnBSUWRSdHFjWjhmaUFzSzZz?=
 =?utf-8?B?L05QV2hjS1oyTGwybm1rdkYxc3VyaEdwTnk5SUs2T0wyY1llcDZPWVFiY0NC?=
 =?utf-8?B?ZjRDbkxMUkdzcFZKdm5WMFQ1WHo2TjJ4SU95ckVqcEJvTWt0cnRsT0VDTjZa?=
 =?utf-8?B?RVJiSWM0N3M5VWFhVGhwblhhOTcyVWluenhaUHMvVTVtZGpPaitmeE11b0Qy?=
 =?utf-8?B?MlNUUnUwNkhpeGd0OGpycFZjV1plRHgzQ0tpU3hpMldXNllYenJTZWlaSmNX?=
 =?utf-8?B?Z2JHWDRMSzlvVFpnVCtxT3lheGkxTkpZK1UwRnEzUVdNMFM2cDNZWGpxeEdi?=
 =?utf-8?B?dnE5cHZUbHEwOG1Db3lEWEthY3BvTllpOFhtdWVHR2ZjSGVJM3ZjM0hFcVZR?=
 =?utf-8?B?dU5XZ0lobjBSdXlLWHhCWW9UY1N6UnhaWGkxQ245ZEpNWEVkZyt1SDlSU3Jq?=
 =?utf-8?B?VHBXNjMwT3ZHc3RYMjA1TVdBejBhRkpiemoxeDFaQmpLbWhoa2ZxZlp2dXd1?=
 =?utf-8?B?SEx2R2VDcU04Wk5VZE56dlRnRFNpeXpGRE93Y1VMQ0prVWFVOUJSbkJydW1X?=
 =?utf-8?B?cFZ3V0dkaTM0eTJGaENDZ0tRRTNJSFpvV1pHcGtaSW5mQVFMMzVhcFVkNDEx?=
 =?utf-8?B?ZUhRMmdkL21mNmM5Q0Q5aHAvSmpOVUYwcituKzRQR2lmdzdLRDJaajF6ZVRE?=
 =?utf-8?B?bVB1RW1WVlhpOTRzWUxpZGIyUXgvWGF1a09lclZiN2pKNVAzQ1hXU0MzbW5l?=
 =?utf-8?B?N2pKVm91dWJjTzBEU2N5UUV3VVpiRXBpanBRK0ZDVXZJOWJPZ2FUSGJ5RWtI?=
 =?utf-8?B?Y1NqVmVpZTcvZFBDVzBEQ25CZVN2eUlMeUlBMGw2a0tvam9XRHp2c2xGVk5F?=
 =?utf-8?B?b3pWcDh1TkxzZENFSEdmYlg3YkVKVEtqaGhFZ252RjNSZjIxalNqTnc2eVZM?=
 =?utf-8?B?T0dGUWY4VmRBS2w2dU53cGtlNWNKT2wxVWxOZGJHVFVwdTQrNFNGNEdTY2Z3?=
 =?utf-8?B?YjZ0WEdOc1dsaUdyWjhQYk5EdmJpMkhyam9zYks2UVFRdTNQTi9QcHZYM1JB?=
 =?utf-8?B?MXN1QTR1MHJ5SkJod3V5TzJWaFNzaW15Q3NhR0FKaFlqNEUvMThPWGorYmt1?=
 =?utf-8?B?ZDViYUxmVTVLbm90bFBzbWhrY1JJSjVJS20yVHU1RmJkRE9SK2p6SFhYTyty?=
 =?utf-8?B?emp6alhmOTUwdDFhTitwcHdTWDg2NWNkN0xGSGdjZkFFUmVSd1ZJSU5xOWVI?=
 =?utf-8?B?THNHMkFIcFpnWlYzRHBoZVMrWG9rZGdTUVhLRDN5UklyT1dOdG8rRG12Q3VX?=
 =?utf-8?B?SlEveG5xNm9yc0p0STQ2UzNvYU84cjJQOVBhRGpFdTEvYTdUY3A1aWRjd2sy?=
 =?utf-8?B?bEV1eUxTbUNSdG9qK0dZWmEwZmtwTkgzN2VIYjcySG5jL2xKRjFqLzV3alZ1?=
 =?utf-8?Q?XtADjNGD2YJGogK8EGmXc6hiChVpZpaVTsdQyrE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e013cfc3-6267-4865-1690-08d942d3b629
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:18:51.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lomqdQy6r8jy4eFKi8zKKos8H0i8uaXUwkgy8uhUVG61J7vVl9Qrc2qjDMUOBzm3/ZQaMgf6mapu2AuZu96bUayP7sw8HrTvEWNPdPCSk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4707
X-OriginatorOrg: citrix.com

On 09/07/2021 12:37, Richard Kojedzinszky wrote:
> Dear Andrew,
>
> Many thanks.
>
> Meanwhile I would like to promote our xenstat-exporter, which we use
> for monitoring our vps instances.
>
> https://github.com/euronetzrt/xenstat-exporter
>
> We've spotted the bug during browsing the metrics.

Hello.

We're always interested to hear what people are doing in the Xen
ecosystem.  CC-ing the Community Manager.

~Andrew

