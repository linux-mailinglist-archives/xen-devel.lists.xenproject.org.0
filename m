Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646535D976
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 09:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109561.209124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWDuF-0002nZ-BS; Tue, 13 Apr 2021 07:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109561.209124; Tue, 13 Apr 2021 07:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWDuF-0002nE-7s; Tue, 13 Apr 2021 07:56:19 +0000
Received: by outflank-mailman (input) for mailman id 109561;
 Tue, 13 Apr 2021 07:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWDuD-0002n9-FQ
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 07:56:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fefe1c8e-8235-48c2-b790-508b002280a2;
 Tue, 13 Apr 2021 07:56:16 +0000 (UTC)
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
X-Inumbo-ID: fefe1c8e-8235-48c2-b790-508b002280a2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618300576;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ax30IPouvScOcAdY0LMXRoIU9QrWo5WiR8aZWZh0deA=;
  b=EXrY7I7chwb1HfaQd7hqdh5G2TiPqPOR0LMOH5nQD2Cn+bqDPxyK4kRe
   F6P8bZIhdhzCh6SWb7nhME7BCKv+Qz7871xou9n0eCVFHMtwU5C9BbK8Z
   /U6IYSlWQVraQGbx8QAFds43coqSGIcEZws6WEUDKtuH7C8lwR/hdyKIO
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DGog4gpGK4WYpLm+iR2kmFigFCiGkZzzMLDeQG2w4gAA5R9iHLghjTIjdoMYtKmwWMC0arZBwD
 Y52CjlEHHZhGG2A1F78SSCIpYEdnTpLuf1mstwxNYWrB4dhMp/IMgFrOv7398DZVBpDsqu7OB2
 XMq4qA3c0ArAlsYsBAKnKFI8PV8uui51NAbEYcwF/+7Vex3hLgkHXwGIhOODq4aaeyZ1zbjMpa
 3AO4fn0kb7IGpsnIV7GMSF5pqZAreuIIT0gCYww0gncSkdRykra7RxBppLmwwbuQCnFC1BpLga
 cDk=
X-SBRS: 5.1
X-MesageID: 41842108
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vVv5z69NR3/NBZZLZl5uk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,218,1613451600"; 
   d="scan'208";a="41842108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKkqZaLH6t2esF62lMTZWqRr++tHhb8lVTErHPeAITLF+QQZtq43e4/eBKLqZ6dIqtcqHOyWZM6Iu2S5tssXm5afZnANBo4bZ29e+C6zEPKphDbWSY9qf/5RU5JoRluV8rWWikNYY6FyXKj48xboAvUW0GzI0pVI+AFsgQe9DBn52Mhg2cVz9fSClfHw//gv2QUY27HWXKvhq4nK2T0Cq9MmFT/eDMohnASmUnLoJq9EZS2iJcZfn2/+mYE1b07KE67z5VpBWCeqdfsKAQbmtT3anthjatQM3KS9Xqkla8KUBxiMIYC5JkDnxJLwURsDyMfzDTXZ554C1xMBZVIa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyqRmKG5k5nWuLCSI84600dJISVD7UlA3qm4sd+ob2w=;
 b=IQZU/tmjY0mwnnqW9pQgnwbWSTOr1imJqRi0EeOOmSxmXaSHTEU6vfKTN5vogmxXPTK7M6qpxL7G8h1vMjIIBUKkGWhrfh0gnZMRF58VdHmhThFgF4Xj69HA4yXzRimXe3hlX6O9bvQ3UVxcC9hB8N8RULLkEfsnUYnUdIhe6eLWaIj7QKplD9Skx7nVDQc5esN9QgbNr5v2ghw9aXmXC+RBidm//URJpvYW2JWMfflzIB1dx5fzRrM8AWzUWWsZTOzoY+1K0Uq0IdY5aHB+r3+V1oILkGx+/PCsHbhljPJdAKsyFNfOakEpqRDno3/otVAXvfXR2H0CUt/CAw1PCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyqRmKG5k5nWuLCSI84600dJISVD7UlA3qm4sd+ob2w=;
 b=DRZsUC5UVOyyPh/IRj1KiBf8/hQ7JCPV9cFtLpbDJOy0ES84r8P/Z6jHFxc12gJsWdoJ7DugqpCkVUEdxvPPpsaxNZG70f+iDScx3cgbwFOAmLbVtcKMjN/XrCzhrKDSdi5nNotQIunmmHIn5y/Ed2AP3ClUdWwYcvoOGrUdYEs=
Date: Tue, 13 Apr 2021 09:56:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
Message-ID: <YHVOlAj1l3wXsNd8@Air-de-Roger>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
 <YHQUJw8H2tgNy5iY@Air-de-Roger>
 <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
 <YHReAkwZPnnh2itL@Air-de-Roger>
 <9571d2ac-e8ae-4105-5f92-0a81728f44d2@suse.com>
 <YHRqCh3zjUh1l2Kt@Air-de-Roger>
 <d8ea77cd-acab-c899-5bc2-416f4d784943@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8ea77cd-acab-c899-5bc2-416f4d784943@suse.com>
X-ClientProxiedBy: MRXP264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7037e0f-d20d-4df6-4867-08d8fe519a89
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5463FA01C22E9F0010A060228F4F9@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xDSH4WjTGS71w6RHSSt0RlhyguNSX4FypwDGyP0MOGSjlfNq/GTGCEmZN1caErN0TBl73Tw3P8Y0EBEZ2NYYLYpPeyFlczHV62U8GdCmlmCJGHtKZnSsTs34Loljbo4HaHnFTcGzICq7htIymEw+TD/+fCEFcydBKAT+47Y6Ep6xnCcZjBToJ0/u7f3Jd1eMH+8C5KhjyBYUwiQOCFF0AdANnniLgCJ5RUC5VBDAL/KjItbz9uTZrNptEzKvKA10wRqi3PBxL1MmcVUxIK0QX3hNBHGCdEfZkbdB2rpQM9fctPyLjbC1SjOrzX3nEK/07pZlswl0ZD/U8ox91JgINCcCXLtriU7rHpriHMRNtrTclU2m6g5X9IQzPTYzRVR/OeOibhaVQAXXxUYk8PBLqpJjVRx0kl/NUO/O+iBaaQdY2wvzFPZsSxDd02qH8OwMXJuQ2WvLKhkPCmr0EigEWZiI8/mUKBy4uEsViLDatAQ95xoFgLGjg6hlUNhQBnrFDErwBXOkZUHvqRvJWX/K/S3BjTDmAUvCli11Is4rD75mc9TA5RW6bHQliDOdUiKGX6D8c5dKBLXPd2mQAtawzC0Z7lVGkUGO+tGxyBYXUTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(39860400002)(346002)(376002)(396003)(85182001)(9686003)(66556008)(8936002)(83380400001)(66476007)(478600001)(6496006)(33716001)(6486002)(38100700002)(6666004)(8676002)(54906003)(5660300002)(4326008)(6916009)(16526019)(53546011)(186003)(2906002)(66946007)(956004)(316002)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHN0UElTTnF4QWc3WHZ0MlFGbkNab2ZiemVqSHJTc1MwQTRoWm41a3ZHTzh3?=
 =?utf-8?B?Zk1Hb2twajVhbU1EaWpPLzhOYVJjVm45K1Izd0s4MWh2eDB6OFIyMFFpNkgv?=
 =?utf-8?B?QmExakJjRWNLcFl3YkQ3ZUVZMm8yaGNyb1dTUnc4Ukw1bGhic09BdnU0L0c1?=
 =?utf-8?B?MWtRcEpYdHhPSkhOSkhuVFpMZEZvQU5HcVVDTi9waE5rUStnVmFvc3VaREpr?=
 =?utf-8?B?TWNlYldMb0hFb3hUeFptZndKOFhjRjZKU1ljNlZTb0E1SlFJc255M1Z0RTJI?=
 =?utf-8?B?c09sMW5FYW9PbVg3bXUyYXJCNG9ZMmhIUDVvbXZnUHJWVXhiRDRXSnJ3WmR5?=
 =?utf-8?B?N2U5elBkajhJT0srWW5xSktoY2JRN3RvRGRVdnA0VjhHSW1BaFpDd21nVk1r?=
 =?utf-8?B?bm9GWHk2Q0pjQXhEdlNTakkvV200cG9OQ2EzVHRBV0RaUjVRYmNoYWVBRzFl?=
 =?utf-8?B?TDJYS3orRlRUdnpNSXVQSlVpMVcvUUlJbFdIb2pVWHRTZmlkL2VkR09ORDVQ?=
 =?utf-8?B?RTBwak5nTjRobWhCbE1BaTZ0T1IvanpjYW9iYTg2RHdReWl2blAyY0hzbi83?=
 =?utf-8?B?K1oyR3Q2Q2hHRXp6TWlKVDJoRVVnNnJUM3RoeWpBYjIrTXZhcVpZZXRQeE5L?=
 =?utf-8?B?NUtyWUx3cXl1eTN6NzFZTUk0S2JVSkRWVkNIY0JldTNNcjAwNWh3VzdxNUky?=
 =?utf-8?B?SmU0QUcvWHVqTlBJNzBnUHNuMnhWK1ZHZW1xcnY0SndqYk81MW8rWHR4cVA0?=
 =?utf-8?B?c08wQ2c3TnJoclBYdUZtaVVqWnNNZnpFK3dYWGVXaGFicm1rWE5VcFBNVmhO?=
 =?utf-8?B?MjdLMjRlbU5KTWk5d0twbmNRVkFDWmpoOUQzSXNMWm1NdFZWRFBmT25zNUNK?=
 =?utf-8?B?c3NhZnN4VFljSzJvQzZTZUdhZnAvQytGbHJoaTVqTjVJalhmYjR4NFJtZUpW?=
 =?utf-8?B?WnJoeWNUYURMU3oyN21DQVR6dEkrb1VQYkpQNWs5NVFmMFhNcmhTMmtiMnpy?=
 =?utf-8?B?OFl1V2VmT2tCdjZzT3Nnb1ljQXF0MG1nSk03NjUwcE9TU0RhNWQ5OUZyc3pB?=
 =?utf-8?B?b0piNG56WXBEa2VYQnFHaTJiU0YxVWNTVnNkc2d5aFd0ZXZVQ2VMVkNEWHFo?=
 =?utf-8?B?N0t2eG03ZnNBOXo4UUIza3BmYWJCUDVzdGI1ZGMyOFUzcld4MjJMVEh4cVdm?=
 =?utf-8?B?US80ZGZxVDYvbkF5K2hOL0ZnMWhKUzE4RUsyUTJPUkZ2cngvaGhFWGRSMFpt?=
 =?utf-8?B?VkRSR2RkaWRiMktMMWE4ZmFObEwxMkIvbW0rNnEyRHNlL09wWVRjci9mRHRJ?=
 =?utf-8?B?V1VOWEhMa2RqN3JmVC8wcC9LYTQwSzBmcHJPUU5EMTRqcVlDOUxGcjBFM3hp?=
 =?utf-8?B?Y0ZyNGxOb1NPTDlsN0xoQktjYmNnT1B3MjVNR1Yya0xEY0tQV2tsVnlxZ2gz?=
 =?utf-8?B?NnZET3kwTWgzVWwvcW9BU09PZDdvek9wQU9uKys5YS8xWnVXNGR0dndxTldP?=
 =?utf-8?B?eEdqR0NyMWQ1aldzcDduTkZPeDE3Q054cFFpUnNWdm5EZVE0UGRNNm45TXBL?=
 =?utf-8?B?MC91Y3R2WUMydnZVZkVGSUdlN1ZOdEdRYThmTGNxLy82VERmdmxQWHJ1cWhs?=
 =?utf-8?B?RlJ6aUswK2JJNjM2YmRWVmhRT2J6ZFJiUS9UazQ3NVBzNmppbDVURjIzODdH?=
 =?utf-8?B?NCtucUI0SjhleitLNVpPTWxVSGRUOUVUSFRPOFU1dWRlSU9CQWxBRHkrUnZk?=
 =?utf-8?Q?F8ASsCGKPN9quv4OO/WNSpzYv8O3dIexXBpjfbz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7037e0f-d20d-4df6-4867-08d8fe519a89
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 07:56:11.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AhwVb4CraK8uDxg2Xp+t72ZJT6pQud3YE+TkU6SGD2Ll3lapcrgtE5z4hVdcBwYiBuN26nw51zCJUUqHZr3hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 05:51:17PM +0200, Jan Beulich wrote:
> On 12.04.2021 17:40, Roger Pau Monné wrote:
> > On Mon, Apr 12, 2021 at 05:24:41PM +0200, Jan Beulich wrote:
> >> On 12.04.2021 16:49, Roger Pau Monné wrote:
> >>> On Mon, Apr 12, 2021 at 12:07:12PM +0200, Jan Beulich wrote:
> >>>> On 12.04.2021 11:34, Roger Pau Monné wrote:
> >>>>> On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
> >>>>>> --- a/xen/include/xen/sched.h
> >>>>>> +++ b/xen/include/xen/sched.h
> >>>>>> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
> >>>>>>  
> >>>>>>  static always_inline bool is_pv_domain(const struct domain *d)
> >>>>>>  {
> >>>>>> -    return IS_ENABLED(CONFIG_PV) &&
> >>>>>> +    return IS_ENABLED(CONFIG_X86) &&
> >>>>>>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
> >>>>>>  }
> >>>>>>  
> >>>>>> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
> >>>>>>  
> >>>>>>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
> >>>>>>  {
> >>>>>> -    if ( !is_pv_domain(d) )
> >>>>>> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
> >>>>>>          return false;
> >>>>>
> >>>>> I think overall is confusing to have a domain that returns true for
> >>>>> is_pv_domain but false for both is_pv_{64,32}bit_domain checks.
> >>>>>
> >>>>> I know those are only the system domains, but it feels confusing and
> >>>>> could cause mistakes in the future IMO, as then we would have to
> >>>>> carefully think where to use ( is_pv_64bit_domain(d)
> >>>>> || is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
> >>>>> IS_ENABLED(CONFIG_PV) && is_pv_domain(d)
> >>>>
> >>>> Imo it's not "then we would have to carefully think where to use ..."
> >>>> but instead this patch is an indication that we should have been for
> >>>> quite some time. For this reason (coming back to your first comment
> >>>> at the top) I'm not sure adding a comment _there_ is actually useful.
> >>>> Every use of is_pv_*() needs carefully considering which domains are
> >>>> really meant.
> >>>
> >>> Maybe we shouldn't have used is_pv_domain as a way to hide code from
> >>> the compiler and instead always provide dummy functions, as even with
> >>> PV support compiled out we still need some of it for system domains.
> >>>
> >>> I'm not sure I have a good proposal to make, but it seems wrong to me
> >>> that is_pv_domain(d) could be different than is_pv_64bit_domain(d) ||
> >>> is_pv_32bit_domain(d).
> >>
> >> Hmm, so we're of opposite opinions - not sure what to do. Short of
> >> having / introducing is_system_domain() or some such (with all the
> >> needed auditing) I can't see how assuming the two would mean the
> >> same could ever have been true. With what we have is_pv_domain() is
> >> legitimately true for them, and both is_pv_{32,64}bit_domain() ought
> >> to be false (as there's no specific bitness associated with them)
> >> imo _at least_ when !PV.
> > 
> > It's all quite ugly, but I wasn't really getting your reasoning that
> > system domains can be considered PV domains without a bitness.
> > 
> > I think we both agree that long term having is_system_domain would be
> > the cleanest solution, but it needs a lot of auditing.
> 
> Yes.
> 
> > I think I would
> > be fine if you could add a comment somewhere noting that system
> > domains can be identified as PV domains without a bitness, so that
> > it's likely less confusing in the future.
> 
> I've added
> 
> /*
>  * Note that is_pv_domain() can return true (for system domains) even when
>  * both is_pv_64bit_domain() and is_pv_32bit_domain() return false. IOW
>  * system domains can be considered PV without specific bitness.
>  */
> 
> immediately ahead of is_pv_domain(). Does this sound okay?

Yes, I think the text is fine, I'm however confused by the resulting
code in is_pv_64bit_domain:

static always_inline bool is_pv_64bit_domain(const struct domain *d)
{
    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
        return false;

#ifdef CONFIG_PV32
    return !d->arch.pv.is_32bit;
#else
    return true;
#endif
}

Won't this return true for system domains if CONFIG_PV is enabled, and
hence the distinction that system domains are PV domain without a
bitness won't be true anymore?

Sorry if I'm missing something, I find this all quite confusing.

Thanks, Roger.

