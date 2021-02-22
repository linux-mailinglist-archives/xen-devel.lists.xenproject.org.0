Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D1321B72
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 16:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88178.165686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDBb-0000py-9L; Mon, 22 Feb 2021 15:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88178.165686; Mon, 22 Feb 2021 15:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDBb-0000pZ-5u; Mon, 22 Feb 2021 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 88178;
 Mon, 22 Feb 2021 15:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w45/=HY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEDBZ-0000pU-EC
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 15:31:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c927d29-4e49-42f9-a9f1-f947172b592a;
 Mon, 22 Feb 2021 15:31:43 +0000 (UTC)
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
X-Inumbo-ID: 0c927d29-4e49-42f9-a9f1-f947172b592a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614007903;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5XPJglws4Iy0I60FKA+1Uk2apZ9Txn/Az1bnwZewBFA=;
  b=Z4CkruL8lhUbgIGXpcqztv27qItnawrB1/sPxakBW3+vX85gnM5Mzi1G
   DTcpBsn8HB3W0xfHyMiUppJTW2mp+HZnNRkT2PHmfjvwnADPyzxFdEgou
   8qICZ2kdyr9D85+14+rLQXkVgp94aumofMIp0VFaymq3RS4N089RuSYeO
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 03OHuxaI4UH063STll9d+eBDUBVjEhmUxcOs65iSDXOeBIKLD6STxs326wwVrq5OCSw9IcO82k
 3qRDRGzIqpW5gKov88CMSSfh1fsds5TQ7VtkwzgtzFNolRq1QCwlcV2gURb16d9/3TIDykk6Fn
 iqy7nXHxJUE/Z5Bs/e3GAl4vRg0TY6gA1Em+bXwE5bytziKbOTN9cG/ma6mBdmzGePmBSnrj50
 QfB/noQUOwQ+EQ5NfygrHe+GPaVvu1KmFRExkpA/mGudAgUk+dsk6wq9yQ4jZwNTZA8Qv9AzHN
 56A=
X-SBRS: 5.2
X-MesageID: 37766510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37766510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XppEhxEoK8z38hk7j0Gk97fsKAaDRrufy4ZVN1/ceQsKM3j+667VHj7rNXCVtYRoLmCMcx1euTBS3QTHblbkXcK9ss5TTLtIT2CCgFq3LFJOX2Oj2uV+OkdXhfD490BEOsTu6NFNuRNdZlrwCPLW4vfmJHVP9HvoVxqCxWMB/W/S/aWuyqTLGuHh2a8Gkz+PxfFLoLHYeFztnbxhHMtNafcrtJWoE0S9CQgEtPpYOva78/Xe2PicycSpju6X21fOJR5+D05Ws+0Ac/mC8BdePKiEk9Jl/71yqIdRkkgan1sop6i9qO1qGyV41fa/lrtgN74Rls1uwPR05ptOEN9pYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE81KYBr9pPb/QK34EJoVBbaFPK/qNZDDnc8VpPlONE=;
 b=RO70A+axRiDNXod4IgIDjKnuHnizXHcxoR0RZWtgVswLdY7L7beWL5YcJQ2l5vR+Lv+6DkoAJG4AlAngJGW/Vp/Wd07CWalJoZ4z24NUGmSgTEE8L37Z3yFqF4q9Nr4Q50OWXehNX82IqKlKM6ARtsGHZuqrKOnNFOy4BUa0ewtYN6fRv2Sgh69yHknZn4+XP6Y7hqbVmvkXiCTIBkHvgF1Qo+i7mfW184tWFUq9n9+TelORbw4UkjXUfB9v55akRVQ0vqSQuY96Vd4ur7TUqKDVkEr865d4imJjvZ07oaKvtboqq3rqXErAHzMLwAxn5Or7qrTJJaF+AtvPzN5OpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE81KYBr9pPb/QK34EJoVBbaFPK/qNZDDnc8VpPlONE=;
 b=KwFjtc7YM6MXlskJWp/pdDWrmRl8GEZmhaBvdAoQlArvSy69R54G7Gdc4JtV9mtKdFbeMEQIbOuQZ2xeqWYH3UzVotY3M4Y8U2ZcStv0xliSUVCQ4TcRqYHO2/5SXrLdQZDht6rfQz/Q1LxnFu6BLzrZ+JD9fjv13Tb9Vc8gIhs=
Date: Mon, 22 Feb 2021 16:31:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/gdbsx: convert "user" to "guest" accesses
Message-ID: <YDPOOpC6/wGZaAkA@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <d1a1b9eb-33b4-4d07-9465-189699f88323@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1a1b9eb-33b4-4d07-9465-189699f88323@suse.com>
X-ClientProxiedBy: MR2P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df2cc41-9cd5-4737-3334-08d8d746e587
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB52738AFBABDB04CB362E8CB28F819@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhhBGobUGfhpB8TNrumEvo79qOyHfHuaPAAc1XGb3Gw4166JT29JxbLW4qfmY5kFlXrnTBJdWZvG6NlKZ4euSCCKcFPqA5RxlUeiirVxaLtavjfFCJlTAfLw66fQP7qiU6MzrQSB13s6QN44VgxGKw83WgdFyAd4dBu8JAkDFZLryFSyg+RaFt5FMFt8S+kOdhYtHbjLVVnyitXxX1qOHrRE1c5GQkDFgL/JhDEqltypvKw2kVgWeiNmTxtESXlbOHKreFqUeVwT/iC61XEOf9c47b2PNPSzRxN5bgGAU7PZSePwX96pF3xXDciBS/r/hZNRHlDlx1ceG4TFGmzg5Q6fVqjl3LO21qYkW7uDTmLk00uIh2UQKwom+4U4cQM2Xux8w+mS0sDcT+flWdR4hdlz8loTTprWOQSzht8yoGAD7FzdECw6pHdKSYX45Nr/0y4UIS636qwJsBGqw5lpAqFJqU39eVXtFPvJiRNWU8W0mR9Oaex3c9zTVz5AFK4taAdAXzs6jC6hLqeaAldO4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(366004)(376002)(346002)(396003)(85182001)(66946007)(66476007)(6486002)(33716001)(66556008)(9686003)(2906002)(8936002)(16526019)(8676002)(6496006)(186003)(54906003)(478600001)(956004)(4326008)(86362001)(6916009)(6666004)(26005)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emxra1UxRHYzSmJxOEIxa3Y5MTc3UFV5bnlTaGNOMThuQmd2WVVaVlQvSHBo?=
 =?utf-8?B?N0NGaGNUcG9sZ0xOa3FLRVhmRkhNdkhqRkNVcmdFcUtsNGtqeGwvV0lZVi9y?=
 =?utf-8?B?Z2UxTWJVcm56M1pFVEF2TWNCUjZzWmpKK0F2aTFnUUlJWDI5amd6SnAyb3cv?=
 =?utf-8?B?YWVaNFIwdzFLWnRwS3BxZDBnbEdJMWZ2WDQ3bkdsVjVzc1FDNkZDRjJwdVN5?=
 =?utf-8?B?Ykh1YzZSRXRNTU8rMDFTc0g4RmNQVWEvcEEvQkxMd2tBa2FIZHp2R0JYMW1C?=
 =?utf-8?B?MElhZTlnLzRWU2pMV3MyMlpObWRxQVd2eGJmU200NzRQN0QyUWprb1FNWk1Y?=
 =?utf-8?B?dXA3RkxLbmN3SVAxbXJMTHJZaEhOd2NjUUdIWGh6dHlNdlE5bHJtcEpBbUlM?=
 =?utf-8?B?NFhRRndxNVBreDBjWUpVVU14NjQrTllNMi9xRlhyalNRZ3BzU2QveXA4Zll1?=
 =?utf-8?B?N2RiWnZXSGtHSnFiaHJPSVB5YVRxcHZMbXk0d1AreXV3VDBTQXF1Z1FaQ2hG?=
 =?utf-8?B?aitDUmhHMHp0RkRmdVMwUlgvamlGVncrOS9kVUprU3RWeUdDblZGVGlWTjBF?=
 =?utf-8?B?OFdpNVVJQXZYUmt3Q0ZiZTcxSXVQNXo4aCsvaHowcWc4eTBFdWwrd3I2Qm1R?=
 =?utf-8?B?emZ2TWlqc2tBNmF5WXNTN2hKTUJiVXE4VVk3MUxMZXkwSkhjbThFbjk4WlJo?=
 =?utf-8?B?cFdpT0dsZFRHTzRTcnl2L1F0QXZSUkw0eWJSL3Boam5Md2JubEo4blp5Vm8r?=
 =?utf-8?B?dkFGd3hBU24yM05veFFCNDUxbnZ0amJQdGZiWXhlWjJ4NGZaZTZ4bkZIK0p4?=
 =?utf-8?B?ZjVXb013UExLWnBDUXVkSHl2Mml2TWIvdUpXNi9mOW5ZTGtTNk1RVlVYOGx2?=
 =?utf-8?B?K0N1QS9uWk5mSWJFbHQvMy8yMFNXMFo3VDQwK1FROWJwbVdnWXZ5N0FSaXBy?=
 =?utf-8?B?YWNURTN1eGEvYjNLY05kREtqRjVVOUtzM1ozT3QzK1FYbm5GekdBWUp0bEhq?=
 =?utf-8?B?c0NmMjNkSG9nbk5sdE52alFQdHVCa3JOZURLekdZbk1nK2ptczh3d1NmS0RW?=
 =?utf-8?B?dlRVb1h6T1BBNGdPNE5NSStGakxDU3BBdUtYeFBSSE1vVklheDluSjBoSkVM?=
 =?utf-8?B?WFdmOU8vRnNPSWxMQUJ1QjJCQWxrTG1GL1g4RW9aaFJWek5Vdzl6S0VCdHM4?=
 =?utf-8?B?ajJPYUl3MmQrOEF5a292ZUJGcFJUcll0OFhqdXFqNURUYllZUVhTY1ZseG90?=
 =?utf-8?B?em5LeXZ0dHF3WERjSk55Sml0ZXdsVVBNbkZOU1ByR0s2ZUV2bXNGeVJhc1JK?=
 =?utf-8?B?MUdad1ZtaVppTHlBUUNFcXhYb21sbHBIblNIY0FBaVRKQ0oyNjZCd1lKby92?=
 =?utf-8?B?MExvdGovU2Jsam9EbENwaHdFQThjLzNQUW12UVVKTU9ITHduY3AwWFpCR3V1?=
 =?utf-8?B?dVJ6ZzI3RHYyZTE1NlBZZG9kWm84L3Fqa2NZaE5DQTNueWVYR1kvUERYY1Fu?=
 =?utf-8?B?V2tpT0JFSWlWN1ovMjVabDFQUU54dlljaitkTjFLRDhwRWVTSEh1Vkw5Smll?=
 =?utf-8?B?ZmZGQTdESjBIaFN4a1N1ZHNYVHU5R3ZDSGsxYmtoV29sdTVkNzVHTGRKMjAv?=
 =?utf-8?B?UlY2MDFtWnE5Q2dHb244QzlhbkdvZlZtYllMVFVGOXhWUzRTM0pNVkpLVDFh?=
 =?utf-8?B?dVlqNkhoUFg1cjNFWlJjQXJjcm5BZGZHSDYrU2d6bWxtVkhNdjJsVm9mb01Q?=
 =?utf-8?Q?Sf9wJO/YXiLX0l1bkqrEmVRhjFx0vxWOeFlqWIv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df2cc41-9cd5-4737-3334-08d8d746e587
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 15:31:17.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OixewPYDKPy6eXfoq6bhPJ7ErFaXIC+7NTdHcjrRdw2sHcqgeedbRsGAFxb5pfZG1EBlF/5/yxaJU4zmwX2F8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

On Wed, Feb 17, 2021 at 09:21:36AM +0100, Jan Beulich wrote:
> Using copy_{from,to}_user(), this code was assuming to be called only by
> PV guests. Use copy_{from,to}_guest() instead, transforming the incoming
> structure field into a guest handle (the field should really have been
> one in the first place). Also do not transform the debuggee address into
> a pointer.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One minor comment below that can be taken care of when committing I
think.

> ---
> v2: Re-base (bug fix side effect was taken care of already).
> 
> --- a/xen/arch/x86/debug.c
> +++ b/xen/arch/x86/debug.c
> @@ -108,12 +108,11 @@ dbg_pv_va2mfn(dbgva_t vaddr, struct doma
>  }
>  
>  /* Returns: number of bytes remaining to be copied */
> -static unsigned int dbg_rw_guest_mem(struct domain *dp, void * __user gaddr,
> -                                     void * __user buf, unsigned int len,
> -                                     bool toaddr, uint64_t pgd3)
> +static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
> +                                     XEN_GUEST_HANDLE_PARAM(void) buf,
> +                                     unsigned int len, bool toaddr,
> +                                     uint64_t pgd3)
>  {
> -    unsigned long addr = (unsigned long)gaddr;
> -
>      while ( len > 0 )
>      {
>          char *va;
> @@ -134,20 +133,18 @@ static unsigned int dbg_rw_guest_mem(str
>  
>          if ( toaddr )
>          {
> -            copy_from_user(va, buf, pagecnt);    /* va = buf */
> +            copy_from_guest(va, buf, pagecnt);
>              paging_mark_dirty(dp, mfn);
>          }
>          else
> -        {
> -            copy_to_user(buf, va, pagecnt);    /* buf = va */
> -        }
> +            copy_to_guest(buf, va, pagecnt);
>  
>          unmap_domain_page(va);
>          if ( !gfn_eq(gfn, INVALID_GFN) )
>              put_gfn(dp, gfn_x(gfn));
>  
>          addr += pagecnt;
> -        buf += pagecnt;
> +        guest_handle_add_offset(buf, pagecnt);
>          len -= pagecnt;
>      }
>  
> @@ -161,7 +158,7 @@ static unsigned int dbg_rw_guest_mem(str
>   * pgd3: value of init_mm.pgd[3] in guest. see above.
>   * Returns: number of bytes remaining to be copied.
>   */
> -unsigned int dbg_rw_mem(void * __user addr, void * __user buf,
> +unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
>                          unsigned int len, domid_t domid, bool toaddr,
>                          uint64_t pgd3)

You change the prototype below to make pgd3 unsigned long, so you
should change the type here also? (and likely in dbg_rw_guest_mem?)

Thanks, Roger.

