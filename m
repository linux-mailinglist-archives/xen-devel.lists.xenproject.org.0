Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514D365CBF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113894.217001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsmN-0004Hy-Fc; Tue, 20 Apr 2021 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113894.217001; Tue, 20 Apr 2021 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsmN-0004HZ-CS; Tue, 20 Apr 2021 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 113894;
 Tue, 20 Apr 2021 15:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYsmL-0004HT-Ta
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:59:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a4ea48-4319-4915-b445-0b4cb31f0da8;
 Tue, 20 Apr 2021 15:59:08 +0000 (UTC)
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
X-Inumbo-ID: 18a4ea48-4319-4915-b445-0b4cb31f0da8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618934348;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pfzqGgouGxErUN/1mqbtk2ePQ6zz8gpzuR9Ml0doMAk=;
  b=gi1ier+FMJCBVU3tDZGMFXDAgQozAS4d/MA8QdvDxE+/4JuofIJnS8Ra
   77FRlN9mP8DMRsmv+1vWHzkoCBoVuXIjNEBAEqtTOrq1kuE8K3ttrOWS+
   o0Z7I3xQypnzHjQXI2l4XYWVlIdUZQO/LyIOATAf/BlAe4JQEpkGYq6c/
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1fc8gM0yeQDoiyC+F8mVaFSz2KHW5yoLUtNGSdI9YEuzPw6cJVMEnWWJVHheuPWvoy0wwHCDFA
 ouOWrjKYK/71S8dORKef4CsugSwy3xMidMTpN4LVsDQHsXQ3p9o1eM50cDUTAsnB0OQjrZXA8d
 2o+0ZSBTrxeOAktlhyOfQxnB9fG1e8tLXS1eyb+Snrhv9vV4rexkyN8MVzcEvERphSLW9oKMIu
 PfNSy6wOsvdoa9KCDGmZk80D0bzYDQ+I6shrf/mAMijnnPHtXdeOttHen6CHdfsoqULeFmw8qe
 TTw=
X-SBRS: 5.2
X-MesageID: 42125117
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8kxcFahnWFbGN1XDDYT1fYRzKHBQXwB13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy48XILukQU3aqHKlRbsSiLfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2SmO2l7XhNPC5Z8NL
 f03Kp6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMA9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m4ufJ+594K+GnzuQQIjXooA60aIpmQK3qhkFJnMifrGwEvf
 OJjxA8P9liy365RBDInTLdnzPO/Rxry3j+xUSWiXHuyPaJOw4SOo56qq9yNj76gnBQ2O1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7nackD4ZvsM4y0BEXZB2Us43kaUvuHl7Pb0nByzA5IUuAI
 BVfbrhzccTS1+cYnzD11MfpuCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w49yK4=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="42125117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7bCqVNnzg3xZZhMKJnQz0Gv5hfKUSzQbmyeuQIq6M4H1jyyjmBVUt5c4GCOkCbyKpS1OBi6vMxLU3HzsVxydSkEvInkZv4AjKpBcQ0HxAOKVAKTDe7K6WnikrngOf2z0w+O85wAgTb9W9tDs25AZVUvWGS1gZjYBoBUV8CkpjlLWyY5qUFoBLg49JwXenDGwBfWNRepTfv+ZYArNutn0HKAzAf3Ru9AZcF3wtsFqFqTn47JHTS00mJE6yZUv3A4Roln0c2rpi+MSCxO3USngCZ9c+s8+SZ09goewYYOTdlt1/8dWv0TN4uIUI0DdKtlz3OWvBoXYWkNnbPZPT1HxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTqAJs4NqeUp60N4LWJpLG3HoOl+mpLjdy/SFXBOj8k=;
 b=eVWmBWIed4ouLhkuvyUbfHLZBd+etbP/QF1eiCGcXNFWBU6s1fKAW9PNE7h9FdqK9OiTHPFuRdE2Y9OVwUZJg4eU9TBYJTuLsrto8qRxqu7EEl0gt0I4/go78hb3beyHfpcsIj+eO07/TdE9vKdle92bwc4S08NQoWxEqfsB84uD3q23ZHJY9/21hRq0qXnIJCj8K10GsfWCv3mWa0Z7U/nRkwGrThFvxeb4ixYEdX9vZ3JB5LHSY8zJorCSUUfWyjxj2uLJZSxpA7SlpdEIyuoUIQYjS/5+tUjH07y0R4+lpx6DOyJt2m4DDa22gpgLLZj6/8zDe2GKa8X9DQSc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTqAJs4NqeUp60N4LWJpLG3HoOl+mpLjdy/SFXBOj8k=;
 b=rrgj3AQMtaZrpylNVwMVoWzOYy/H2NfICnjyDdidr+ssKr2dE/8miodX3Y176VPRK8foKPR8BVhoeT26Mh6QaKdfumGPMudUjV4wZhC9vfN6dDVoK4PnSofQMRX1W6DgSrH/ObPxB3jZhEFXbj9Xi8sH78TNKG7OG4/2cW84qeg=
Date: Tue, 20 Apr 2021 17:59:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/3] x86/time: yield to hyperthreads after updating
 TSC during rendezvous
Message-ID: <YH76RJTqvwYmvXu+@Air-de-Roger>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <81da85eb-2e8e-9b76-2fb3-2beddc33e9af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81da85eb-2e8e-9b76-2fb3-2beddc33e9af@suse.com>
X-ClientProxiedBy: PR1P264CA0005.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcecc535-6c48-49bd-c0ec-08d9041538ca
X-MS-TrafficTypeDiagnostic: DM6PR03MB4842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB48421D98F5C0AF9F641EC8C18F489@DM6PR03MB4842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHxsRDbWnuC+fAALazpqtn6KO8KnbEzRqXPxaHMyl6P21k5oBiZBwQSL9fo0pnCznl/I3wiXwrjI63nhO8kMjZFlXNLsDWEHoeR1VXfwf/9saei/+CTAY8qPL8hII82b7VDqR/LyF3qLesv2A+xInjd2ikcEhzREDWbOJIzmozXeSWft2kJ7nZrXUt9IVJiwEAqm5Sr69goafdn15MIUSK5l2Cpw/J+aKST2r7x70DyDyUSdyYhxVGieToiVVJAe/WetwZV1EMmQQkqDFAgRHI0wYIKFilKts8vpch8EL4Uv+QcYgkzFVh3O9b3b0AiHNCl4Ocv+mE8PR2FHWtOX8r0Gd7sgF2NnHJNN1nA7xuVxnpRsIC+6CL0JPBkSdpYMbTUVdMReb5GtknBl4F2t4VvFBsPYy/Ss7mDr0UwRqkrhriWpPheIi9kXniE/v9y9JOzHLzxVc7VjuKswz/fsSlJdsvruyswRw0kkPdympXk64qz4TJ9UcXiGM1MmudI5IMZhAhsHJsnuH1FD1ocxo/aQvD0TDtbo5STFT6UFlastLbEvp5QLztZ64UFX46KhTWi/ReDomciehuC/6N/otHAYRkMopyT0cckOWPBbEtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(86362001)(2906002)(6486002)(9686003)(6496006)(4326008)(26005)(478600001)(16526019)(38100700002)(186003)(6916009)(54906003)(66946007)(66476007)(83380400001)(956004)(4744005)(5660300002)(33716001)(85182001)(8676002)(8936002)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWVrTTlYWXJQY01yVjlqQjd4UEY1UTMxSldxekRSYjNJK25kUU9lRGhZUjR6?=
 =?utf-8?B?MFkrdlRKVEwvYit2TnhZdVRHdk0rcHdBQ0Z4ZUtocDRoeWVRVlR6THVBZjhW?=
 =?utf-8?B?Ym91aHc4anJ4ellNRDhMYVR5YmpkOWt5Rm1BWVNBeTRiNS9OWHFPd1Y4QUtx?=
 =?utf-8?B?bWx6Wm0zWm1UZHk5WkRsMFVlNk9ucE1Pbi9TWVplYWZ1U29OUEhScHZPOG5O?=
 =?utf-8?B?bDFsbmE4K1ZhSGgzdWkrTll1dHQvbEd4cytSMndBS3JPNVBDNFNkV3h1VnJj?=
 =?utf-8?B?MmdXOUtqODdhVk1aaVJ5REZTRXlXeHBzcElnMGZ2VWl5NFlZUGtnRWhYOVNB?=
 =?utf-8?B?bHVXbk9sVm9xWEQzQk1SZVhQUjJxYVNPbUUvQTRNOUhScjZUQnBZY3pmL3NW?=
 =?utf-8?B?cmRJTHVsNHVVMGUwNlMyWitMckFzRXB3R09IOUhWOXl1ckg4Q0g0NC9ZZTZI?=
 =?utf-8?B?RGM2cUc1bHYwNG11MGs0cU1wUmFYdmlCVmd3UUFzWSs4VXoyN1gxV05BMmZW?=
 =?utf-8?B?dnBaQXo5UmFkVmtUYVZCbXM4ajFNSDYzc0hTWEI3RU1GcTZxSXB1SlJpTEpB?=
 =?utf-8?B?SjhxMUZZRGxiSHhFdGVQY1VidHhSK1hQaExlMjZ5blVxelZPdU9zMFpxMEpq?=
 =?utf-8?B?UENtTmlMZWJZZEJ1OHRHdmhaOGtTMCtGRWNPTzlDSm9KanhBYWRDNWo2a1RQ?=
 =?utf-8?B?ZWdKUjI5aUozMng4YktCZE1HT1FEK2ZURmdaY3k1dE1CdGxjb3pBV0tRUmE3?=
 =?utf-8?B?aEh1MnN5dklXYktXYXdhaWYrZE5PdkNEVWswVE9RaVBidlN1ZXdmUS9VNUJW?=
 =?utf-8?B?RWgzcEdSeTROV0dBZlJyWGt4UzZ5aDZ4VDFuYitEcmdxZWV6NzF2OG50QmV6?=
 =?utf-8?B?MEErVUk4Nk9vVWF3UVFPM2RJbk00SHAyelVxbTNTNVVTWnhTdTlEWXJWY1FN?=
 =?utf-8?B?V0RwVlY4Zy9yMmxRcnNQNGtBTUY2U01LZEdpbDNZT3NVblgyeG1tSnRZSmRk?=
 =?utf-8?B?SjNMWFVHaWdDdGliQnA4a1JjOHYxVk44TUNhZVE2NitNMzRDVFdFd2ZiMURQ?=
 =?utf-8?B?bWx6bjc2dyt1UVlWK3lQa2N2Z3dEOFo1ak5qTFJ5K0ZpZXpaZ1ZycE5KUTBn?=
 =?utf-8?B?Ti9pKzcyU3NKVVVLVDIycFNXSTdkWTg4MmgrUnM0bEVKU003ZjdsbVRYblhS?=
 =?utf-8?B?Mk53Umdvd3MzNksvWC9OaVMwWUpFb09YbzgyUkdYc2xrNmhtZitDYng1MHVJ?=
 =?utf-8?B?d09HWDNPQ05XWVpRVk5JOTZWZ1ZNSWJHNkxHdUdZRWltdlZuQzlld0Q1Tzc2?=
 =?utf-8?B?YXYyMklLQU9lR0pjRzdWNlQ2MzFxV2ZwY0lKc0grMHdjdVBqMXZBeUFveEh4?=
 =?utf-8?B?eWdkdzl1a1E2L3pwdkswODBpMmtkNVRHbWlVdk1xMnRUNWR2amlsTU1KVUtF?=
 =?utf-8?B?Y0hyS2tOL2E5Ny9nZXBFUzUvUnVyRUdhUHlwbk1hWlZTay8xNU9FbTFhcEFr?=
 =?utf-8?B?UXpTYWdDOHdaUnJJZzl0cmx4OUhLVEkrVXJVZkFsQmZrYng3OWFGUjAvdTJ2?=
 =?utf-8?B?K3NjQjYxS3RWcDhwQ0JQVEI4Mk1JK3BCRDRMbG9uT2V3YnJpdGhablhsQWZx?=
 =?utf-8?B?Nzh5OVF3Q0VxMVVPN3QvTVhPQU5mSk4vMUZYMVhmY2JHSFhKWXpnVnNObGt0?=
 =?utf-8?B?M2pqN2hRaGxsbzJSbjh3OVhnblVzMThDV012TXZFUWFxcUVGZmZwWS9CNER3?=
 =?utf-8?Q?WFATWGr0EzejuBmv74hsV1/Xq2PKYX9PdqblN5P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcecc535-6c48-49bd-c0ec-08d9041538ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:59:04.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGIPvxfpkq+ywetT6LavCOq84mKmtupvGp1hyJ/57iit4NNcUDLfTdyGYBK3yHUFGs2aum2Qb9dT6u/h+kCzeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4842
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:54:27AM +0200, Jan Beulich wrote:
> Since we'd like the updates to be done as synchronously as possible,
> make an attempt at yielding immediately after the TSC write.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Did you observe any difference with the pause inserted?

I wonder whether that's enough to give a chance the hyperthread to
also perform the TSC write. In any case there's no harm from it
certainly.

Thanks, Roger.

