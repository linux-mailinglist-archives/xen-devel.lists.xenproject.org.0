Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715262F12B6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64817.114586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kywoB-0005eM-Ue; Mon, 11 Jan 2021 13:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64817.114586; Mon, 11 Jan 2021 13:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kywoB-0005dx-R1; Mon, 11 Jan 2021 13:00:31 +0000
Received: by outflank-mailman (input) for mailman id 64817;
 Mon, 11 Jan 2021 13:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kywoA-0005ds-D1
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:00:30 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0e00631-4c8a-4fd1-a7f2-236e2228fa1c;
 Mon, 11 Jan 2021 13:00:29 +0000 (UTC)
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
X-Inumbo-ID: b0e00631-4c8a-4fd1-a7f2-236e2228fa1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610370029;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XNS+dhkrrvEl+rgJNbnGsxh0b+UUnLnEQt/Y6SQKhN4=;
  b=O4kDTCZLLCdIVH3GL0Qoo1DO6NZza71XgMT6abmnW9pAIez8uhnwnkmg
   zkRsotxIW5GmokvMGqWl6J9feYd4HrwRESIst+BPgqez2SIPi9Ob+KE2E
   KB5LgsGnXt+8e/TtVbhq6aNcRu06v5nviSw0vxAbg8JzGK0nBQcyMCkcw
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AIklYBXYcoLuBpG7Q5IYmeW1etHgBNWCLXbtKg0hvAgaBxB6t3jyHxu6Y6MA53qnQ2cWii6rdP
 ndhfPiCytiPDAcgPy17acXFVFjJCkjATP1jGo7Gnwhk429juSIPMqDFAB3d1d5888Ro95WJEgW
 edlCp+T6HAf9k6mxt3JZ590FzN1Ya//X0OYVAIG7nJ81bmy4UOiUv2oBOkvqFbrLpwe1rAp5Z3
 3TFGUjjHhjhiiygH56jXL5s4I9ij6VHteqmOl00TC74rupqfpnSScZ9+VvSzocXL4qoyNoH3gW
 mEw=
X-SBRS: 5.2
X-MesageID: 34862483
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34862483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ4T5jBIwJi3+ejuSSIHRejPaOQzy1Xc88sUOTTza9507Q4uxfCNrrIWsBRp17zg6VY/KafHp34s1e7/cyRHMo2HCQeUcbkHtTgltoFz8XHY4dj6b0fpyDv1tkr5OH/fIlY5kEj2sDGSr3CgshHR9tizJy1pB2LWGd7DV2bdHpcK4ECciHTAnWeX9wSEwHoEcM+mGpPmwRM4YvpzXhrAbcWaNYHFzRGjFplzbq+4z1pWtgP+VaVGTNmWb901yZD1tZ1TITbg2VslvQJiRyZ6Mh5FLxYBYddn0+UPmv32x5veIoJwuhyQFp6cTTcj+ZM+hBqfCkRcRAkrsAxnBHug2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEIKH+J3HvFClxe1H90ZDZp+VTvccNYLgzup+gKTAp8=;
 b=OEt2UhWucRB31pqTx+e5vOQM6V8eou+cqedREIVnmMwwMEtj7ZI2rRHje+i7wOaxzfB86l5M3ueka6Psq+AwD2inUYMeYBvacXygxlc76aAezn4T/y54RNcLWGfYQt3WqRF+S/tl0O1+jFvETpEGsen9INBFs51FTP3QZmXy+BKMRvjwFJRt/d58Lff4bx5nNbw1pKRuxCE147Q1E/Ntucay+qRzo27NdfWeS1dLlQMpUaacGRA+9Yiu7RTaaEpn7PPWQS3/o68Mqxy2g5Srs/WeuNvJXYBV/RQ31NmizHbB4zR6FEyxpKgyEJ0YvORwb43s7xn+749Gc+Leiczf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEIKH+J3HvFClxe1H90ZDZp+VTvccNYLgzup+gKTAp8=;
 b=XMdqr94qccCkWZtnuUHBZRGQpjpKBgdAFuyWNypMvy0wazQM7evW9EPnF5mFk69u6EPQi3UFHw8QnL3pxd7jPGLo2OXg1asPzNw6BnRT+7R5bl6fdhJOrsHUMfgqUm6mtLd1fSi0b6HpTcZAqjP+wyZ5QfpF4D63m/6ECrtjHgc=
Date: Mon, 11 Jan 2021 14:00:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 4/5] x86/PV: restrict TLB flushing after
 mod_l[234]_entry()
Message-ID: <20210111130020.ogpsylc7sh3wzb7i@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
X-ClientProxiedBy: MR2P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dee348cf-92be-4f38-0be8-08d8b630dd43
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB460164B0EFD498C332ECDC128FAB0@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vBG4FIujuufNBUSjAneyiMGSmTtyHuH8V5ToYXEs6w+gRanzxahiGik088ohKjVpp0ipy2n6F6QeLltST30VY+UfCujmXLa8Nl6gnkMsJ42jAVrgupQ5jroTQtgW9SBq8rmQVP8/KpzIaiNEM8wPVlfkTxilRXoCoiOfnOJ8FuaeTbb12YkO3JduutTGcXHGS0EaoNNSkAgwVrbuv3+DUixVGIMcg2XNgOt8NiM7fOonZL6nZrPRw3SEyDbq45ABKPiGtDDbuSbzc+I1imksWDTlD85rUO3EV8dvw9ChcrXfIPbe/lPp+eiwpCDiVRKNG5isGMKTInIuzXEvKWT6x5O7GkezLJ+Lo5Bf9KBeKflsZF/pIncKybk9sjYBPM8nuxrN9W2uZsKCXxna00HmEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(396003)(39860400002)(136003)(366004)(85182001)(6496006)(107886003)(478600001)(5660300002)(54906003)(2906002)(9686003)(6636002)(6486002)(316002)(8676002)(110136005)(956004)(86362001)(66556008)(66476007)(26005)(66946007)(6666004)(186003)(4326008)(16526019)(8936002)(83380400001)(1076003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkdPOE41Y2dsZlg2UUVqYTBFL05tRlA5ZWNJR0EvblJEU1J3eVVHVVllaDFT?=
 =?utf-8?B?Qi9vTUtYZFdkeUxDZzlTYXFtM0I5VldRcWZ0M2hSczgvTHdZRDBCcDBra3c5?=
 =?utf-8?B?aTIrbzczTlh2enVDRzQ2bU5XcUxzVXRMbE0xQTFjM1Z6UEE1d0x4cHFNMlZx?=
 =?utf-8?B?VzUyR2hOUTZ1YXRZYWpHNDJtZjBDQ3NWd2RYK1F1elBKaldockxHNUdZQ1di?=
 =?utf-8?B?a1NoNTlmM25IaFU0Ui9Lb3pKam96dlNFa3JudHN2eXJQcjE5SytwZlVEY3NJ?=
 =?utf-8?B?b1dQTXR3WWQ5VHd4Rko4TThjS0JHOU90dEhwY1FpenZacVUySTNwUS9uNTlT?=
 =?utf-8?B?RkE5Nkt0cnlaMmRrWE1YbG5HNFdqVGR3WkplTitpdTZIYkp2RmV1V2s4VnFS?=
 =?utf-8?B?ZGNwKy95K1ZQajFOYUVOZDlMVURTMUpRZjdmalpiSmh0VnNicnQ0U0NTWlBv?=
 =?utf-8?B?RU9uaWxTbzU3dEhOc1FQN292TitWcm1NcEdMcTIxQ3ZsZkxMc01HYytvY2FK?=
 =?utf-8?B?VXpLTGI0bUVIQ0hCZjVsMStsbVdQeG5wS0NnNUd6RjNCdlh2YnpqenU4Qndi?=
 =?utf-8?B?c2lKRkdjTzZPcGhhdHROVFhibS9QV3JhM2RmZlFxSUk5a3F2Szg5L3U2WTFW?=
 =?utf-8?B?c3pmRFRRWkh4di93UktIZjM2ZXg0Zk1BNFlNRHZKbDRpQTFBUFBFUW9RYUo5?=
 =?utf-8?B?Znd3TW1BODFwZmRWN0IweFNBd3lVRmY1bEQyTVZtejRjRjMwVE5tYVZYUzEr?=
 =?utf-8?B?L25SY1VTZkRBWHhkRjJoNnUzWTlmMDJNUE1OSGRtQnJ1cHVIK0daRGdWTkhh?=
 =?utf-8?B?Mm8zOUVxMWNVT3R0RzA4Y1BuRzdsU3ZwSlhyK3hWUXlRbG5FR0lhSll3dFQr?=
 =?utf-8?B?Mkhja1dPdkowanZsbWNuVkZYRi9XdkhyZk5VbzlyTlJvalNOYnNpS2pvOGZN?=
 =?utf-8?B?c25iRXFETUZ6US9pOGVXRUlhcHFySTVrbUx0a013a2k1YmZweXQ4Tk5hR0Zx?=
 =?utf-8?B?Qm1PQTJxV081eWQrbUcvQmhGNUZOWXdKNDB4ZXVCdkhaelhidVhqR2p0K1RD?=
 =?utf-8?B?eHltRGIyQnZzVWJncEI3OUdmNU84MVlkRk8rNlE0Vm1WMkRqSytZM0ttZmdT?=
 =?utf-8?B?NER0cnh0eHVVT0lydGh6RVBtTVoyT0l5YXhMd2tCdkc4bXNaTktwcGJDZDBh?=
 =?utf-8?B?MlBnTWZCd2t0dXlnQVhGTWMvNVo3MktaS2F2YVZTZTFlbC9nb0N4SW1JRHpH?=
 =?utf-8?B?REpzN01FM2RBTjg1dEpuY3dyYmw4My9BbUFaNGptU3FibTllakhDTWFWSUM4?=
 =?utf-8?Q?XwnCh9f7lZDfRBQgElS+tSpytNyL4zxe75?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 13:00:25.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: dee348cf-92be-4f38-0be8-08d8b630dd43
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HB1tMx3padjHQuCyb/mZesgSlL5BIyuM/vDsVUnBaymui+VEffSV+8K+WxAeZKziNAd9Czs2uBCuZqvBmQ8oQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601
X-OriginatorOrg: citrix.com

On Tue, Nov 03, 2020 at 11:57:33AM +0100, Jan Beulich wrote:
> Just like we avoid to invoke remote root pt flushes when all uses of an
> L4 table can be accounted for locally, the same can be done for all of
> L[234] for the linear pt flush when the table is a "free floating" one,
> i.e. it is pinned but not hooked up anywhere. While this situation
> doesn't occur very often, it can be observed.
> 
> Since this breaks one of the implications of the XSA-286 fix, drop the
> flush_root_pt_local variable again and set ->root_pgt_changed directly,
> just like it was before that change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

It would be good however if Andrew can give is opinion also, since he
was the one to introduce such logic, and it's not trivial.

> ---
> While adjusting the big comment that was added for XSA-286 I wondered
> why it talks about the "construction of 32bit PV guests". How are 64-bit
> PV guests different in this regard?
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3903,8 +3903,7 @@ long do_mmu_update(
>      struct vcpu *curr = current, *v = curr;
>      struct domain *d = v->domain, *pt_owner = d, *pg_owner;
>      mfn_t map_mfn = INVALID_MFN, mfn;
> -    bool flush_linear_pt = false, flush_root_pt_local = false,
> -        flush_root_pt_others = false;
> +    bool flush_linear_pt = false, flush_root_pt_others = false;
>      uint32_t xsm_needed = 0;
>      uint32_t xsm_checked = 0;
>      int rc = put_old_guest_table(curr);
> @@ -4054,7 +4053,9 @@ long do_mmu_update(
>                          break;
>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
> -                    if ( !rc )
> +                    if ( !rc &&
> +                         (page->u.inuse.type_info & PGT_count_mask) >
> +                         1 + !!(page->u.inuse.type_info & PGT_pinned) )

I think adding a macro to encapsulate the added condition would make
the code clearer, maybe PAGETABLE_IN_USE, _LOADED or _ACTIVE?

Thanks, Roger.

