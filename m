Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB513373DA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 14:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96541.182722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLN9-0005bF-B0; Thu, 11 Mar 2021 13:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96541.182722; Thu, 11 Mar 2021 13:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKLN9-0005aq-7U; Thu, 11 Mar 2021 13:29:03 +0000
Received: by outflank-mailman (input) for mailman id 96541;
 Thu, 11 Mar 2021 13:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKLN8-0005al-Ix
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 13:29:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc83307f-3858-4eb2-8a85-bb8f71cb5891;
 Thu, 11 Mar 2021 13:29:01 +0000 (UTC)
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
X-Inumbo-ID: cc83307f-3858-4eb2-8a85-bb8f71cb5891
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615469341;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DzlnXfHu3E0CiSDJExmPfxAYPu8qtXUSLlXDgNzQwv0=;
  b=XEbyJRY8OnarD3cH7/vXF04gPNwmasUUpC3up2uD/zJQKStKbZcyCHzC
   6WWMMqvYmn48ryGvXd1VnOOOuQAmbd+//Uqx9ku+j9k65FXt8mMnIroo4
   QI+BDxPKd1aEUfcYJYQhLoYfyX77P0Hp8s06pk4WNVvG1m2ttszOdPycG
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xbh7ZpHljAF8jgsW6FPnkVap5reVh1RnCfA7e5yMik+RYuEvot9Kg9vgEXbGuMIggyIJEoBFxu
 yDPcPa6HyCwrzrRZ4XHQoznl3EPfYVeUER1pufn6cTFJ/1V4iQIMAswjguTRlkmPtxzUseyjiT
 Ebg9twZVnJa09zhMZhhKw7s9nTPcEZcmNZD8DDjxCfti7HdtGnwnLQlx9go+7ekHGRAeJMRpT1
 M6432RaV8pfQdOlQ4SlU0zkrdFphxSZ5SVK846+j0uEDgdQxwDhW7E0ZNVchu67h42Q3Kk+zLJ
 pVk=
X-SBRS: 5.2
X-MesageID: 39047544
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QhxTo6EPsE+vWkYtpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFELM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39047544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1JDlfKQKB4mlN8KQhgYqyEu1gH95LECbqtUdygJRWaUlQ/TgYVE+RNKp7JidJsD1wnRgjC4DIuzaDiJAwb+eeuK77xeh+0N1jcQnO5UzVVjApMDrQn08cbR5w+Lffk2XDvmOfRT8+TWW1gadW4gjJZX+wD+B02rrMttjnYSnBfjCkGJv0FrygjrPkM2q1byW8SdZ3+jTKrcEKDKA21swX34YD5buuOnrEQ6WFZ4b0cgDZ9keEstORfizsVeUfwBR24a7rsRHe28OPrLNRdQOr4AuSlmqw5RK3u6qiq4zu3dwgcg3p54RCMzeK+Xnogy+gleaNLrYDnNG6DgrmGsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px5mo/EHB1WU3sUDzgONHAk9I9kK+yXGOFgRCDuZoSg=;
 b=LYqkKPcXU03hJF0Dl2yYCmQByrGSJyzgrRjMyklQGA6N8oFst/LND2B76LdFmKKBT5YzfgRScFzFs7GS1OwCIK9pg3NRwolPLhwQ0cgy9XyrDvxYc4y/Aelym11H54dNmIpKUS4V39s5hsZIwyvuckC5Vzn/01vyJajZ/TKIUAnqNbq9TqyOWlE/V4QCt+voxMNI84cRziTtRoBw6aGhDgyU2xpokBDyalwEuTXQjyLPOSoXGCAFreF3m+lQqH3JKn/EkLyiB72+fa51lWV07rmT5A0/lvIn6iKOac3Sf5W3b6oLa1pWxFvfi56cqXIgTWPDtHgMmht4O5mkCvsECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px5mo/EHB1WU3sUDzgONHAk9I9kK+yXGOFgRCDuZoSg=;
 b=RoO5JMsQEBrSOo1s3UTuLnAgHi6wjtUZ+whPmBTbBpepiDqn++y9W+5ZmnNwNCPOlwYPoIdMKCQiSZHHfr6avzeSkFTaLN5dg6wlGOIHtBoSmPfY8YgV+YaTw0DyQ7i+AJIsAJ2OSnxnFkZklhZGHszqTzmtWHxz4vSYWuajQsc=
Subject: Re: Ping [PATCH for-4.15 0/3] tools/libs: Multiple fixes to header
 handling
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Ian Jackson <iwj@xenproject.org>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ba6bb453-e184-c8cb-1bbf-d730884436a3@citrix.com>
Date: Thu, 11 Mar 2021 13:28:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305124949.6719-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a79725-7c0f-4165-b38f-08d8e4919511
X-MS-TrafficTypeDiagnostic: BN3PR03MB2275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB227503DA75875284D602335DBA909@BN3PR03MB2275.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23cxN0Xq3y9PJgG3flZKjvVOwOkxCPQWrSOgFr9IMxnd9Pt/dic7qQ4X36U78ver3be+2BfgKRCb3jJs5qFPtaUmvHmPHwR0lvNaEselCb5x3OQFJMlUok2Cw2qFa2c58zXIjdT0Y5i8wVeyWLG37NvPqkoqxJ2UB292E/U/2kVsxES3jjIWsxOpYp7KMnvW1CXPMM58rxmZoGPj+3VoU7Ka32VAssN9YxeofkvgPg9CH/HqOfHDM363sYI7rRWaWYhBjl9wJx4GM4Kz8G1Po17KnSlNLOER4VfLUry/V5jYs3kpMVKjcZWQkhM/5h+0PYBJNNukdlhZ4l2mvkEGX8a9v46uKmHgXVCeHiflQ/E3SnpFriDT4Q4O7m6fSDUPop5IvYvWhhu5sZiq73kT+3dCCco7nSzIhvBBUE4eADhz77SfNIPHeB/SqpQ33neDzsa0aqbWOc37mYtfCnTtgiDM7hfDWdep+oveUdIYgoNWB/O5qJ4dWwkYKBo99fiOImMkSkciQ5PT4LSjSeBopihJiLKFCNmllTKQeSmr4h0G2jN5UbJCjeASK58B69EYJDRh4VfQ5vDc/SctAOSdgukcoi/DuOL4v5zLXDZIvGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(346002)(396003)(8676002)(316002)(478600001)(16576012)(6666004)(4326008)(66946007)(53546011)(66476007)(2906002)(6486002)(66556008)(6916009)(8936002)(26005)(16526019)(36756003)(5660300002)(2616005)(956004)(186003)(31686004)(31696002)(86362001)(54906003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzJsY05IMi9lbUlCSHZrWkhPVzNYbjBXZUF4SHJ1MUwzQVVVN3NLb2hCV2c1?=
 =?utf-8?B?STJuYzhUZ3RPZUhYU3kzOExvdkhUYTVzemFialY0MU5NSSt5Zzlab1hPWllo?=
 =?utf-8?B?N0pETkNYMU90d3FGdFBUYVhSREpxYnkxMkN2OEt1c0d4NXZqYldmcEp1RS9P?=
 =?utf-8?B?RmY0aWRXY0FTVU9tTnczRHVlcVpjczFzZEtQM2RpNGErWTJkZWdsc01VVEtC?=
 =?utf-8?B?dFZ2T1I5eW1YaDI0aUZwS1E4SzhuZ3lQWGcyUUNweHoxK1F0Zyt3N0NxcU1J?=
 =?utf-8?B?dUlJcWh2UEJkemc0dmdpZTR4RWkzQkMxLzBLdVo1bzRvK0lib1hydkF4NnAv?=
 =?utf-8?B?T2xwZjAxMUUzbG9tRFFEYTRiUHg1ZG1VU2RBVkhScTZ3ZkdaV3dsRytQZVBn?=
 =?utf-8?B?bUdTcFZQWlc2S2dYaUpwMEM5UWQ0QWJaYWJJTHNSSzUxVVBOSWcwejdtNE4z?=
 =?utf-8?B?elVLN0dCQ3JoL1hzVk5lTTBPWnFaN1p5UXB2azJGZzZsd0pyajdISGtIa3ps?=
 =?utf-8?B?UnZsTC9nWDNzK2c2SDFFSFJvb3FBbEZWK3ZZamZYOTh2Y2M2UkVvSkZyQmpE?=
 =?utf-8?B?amFadzJXVVltMVdWZUVMT2hjc2xtMW1VekxXNng1emlNVnI0cG9JM0hOUUVm?=
 =?utf-8?B?ZEdDd3dBT3pjZFlNMlA3OW1Zd3hmUDB0WldvY0JrYU9LRVowc1pJWVg0VUhH?=
 =?utf-8?B?WHZCcjBBVlI3MC8wODA4N0k5Z0U1eUVQdFFJbmJhVXRBNW8zeE1ac1F0ZFJw?=
 =?utf-8?B?UGdmU1daRU43WjBvY1FLUEpkbTZJQXp3SFpJbllXdTlnclgwd2xRbmd6YVVn?=
 =?utf-8?B?UENNUzFmQk5ITFpOcm5qeTBIQjk4aThPQkU1Qmx1VjRVTVpReDZBVjh6ZHl4?=
 =?utf-8?B?SzNrMm14cUN2NE5DVEdwUERsMDNtQ0xsMEY4Umk0akpJR1pSS3dxSit1VWFJ?=
 =?utf-8?B?cXhOa0NLaGtVUlpENWZMb2U3OEVRcmJXK3VFc3RUTURlVkN2a0F3Znd6ZzRi?=
 =?utf-8?B?WUNpTi8rTnlrMVRPclR0TGxCY1dXaFUwSHcvVWpzNVBLUjdycWlTdTVScGEv?=
 =?utf-8?B?V3c0ZnRqSlNuQlBMeWRRTVlLMkJGTlQwUUx3QVlrNW1Tb2NVKzZTSHF3OG9z?=
 =?utf-8?B?ckVEQkRWalNmSlZWelhVK1pleHlTYUhCMTh2b2tzL3k0T3BUTURvZ0VEajRT?=
 =?utf-8?B?aDRWaXZBNnc5Y3IxK0o3dDRQZjREaHFpQ01Dd2tVYXNNeHJDYTZLTVl3UTBR?=
 =?utf-8?B?cGhGaDdyTW1aWUtsVkdlVHk2NFVDRHJ5Vkh5Q2dkTjlXNVhneDZKRDBEeW1V?=
 =?utf-8?B?ZVlKa1JOQXp1NTU2aU5IQTJ0aFJiUm51eU5XUG9YNEh5bFFjYWIwbDRnUmxq?=
 =?utf-8?B?N1ZwbS9JUE5zOHNrVnVkQTExNnU0ekxnYUFNbmlFMnpBaTArYkViQ2s3TzlI?=
 =?utf-8?B?cU00OG9PYURUd2pQRWxQUnNIVFQxS25CSDhlaUQrY01Oa2s0NENRTnFiN3pz?=
 =?utf-8?B?N0tzSzJ6cllIdWxXcWE2QTZ5QklPR0haN291SStGNUZHeFpDWGtiY3dVbkdo?=
 =?utf-8?B?dWhhS25hZG9sYU14THFLRXdIclVlNFl6dzRWUVdTRFA3SDRxOG45K2VuRXVT?=
 =?utf-8?B?MC9SYkk4REJDNXk2bzdsczltYkVmdDVUdTg3T0RQcFNxUzBhL0grd3B4RndX?=
 =?utf-8?B?T05wT1RkRFltMHgvV2NMc3kzditVUzl3WXEzc20zQWtqSzU3MlhiTlBuNm5P?=
 =?utf-8?Q?5rTj1m/gpGC+8XEHGMHujDF4qagHuID4xDT2het?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a79725-7c0f-4165-b38f-08d8e4919511
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 13:28:40.4765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj8ZFdCKX4lo9qZWe1zJlr8eoM0HD94GUPguq1q2qnTAc3vhtvo8D5+1KuXR6hZrXukBn0k908dsSM1Cng0v1UJGfr8qBPJFBkHNTxri1oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2275
X-OriginatorOrg: citrix.com

On 05/03/2021 12:49, Andrew Cooper wrote:
> This can of worms is festering.  See patch 1 for yet more issues.
>
> Andrew Cooper (3):
>   tools/libxentoolcore: Fill in LIBHEADERS
>   xen/dmop: Strip __XEN_TOOLS__ header guard from public API
>   tools/libs: Fix headers.chk logic

Ping for acks/otherwise on patches 1 and 3?  (They're already R-A'd)

Given their simplicity, as well as being regression fixes for build-time
checks, I'll commit them tomorrow unless any objections are raised.

~Andrew

