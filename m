Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707934336C1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 15:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213211.371366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcows-0006vD-2G; Tue, 19 Oct 2021 13:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213211.371366; Tue, 19 Oct 2021 13:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcowr-0006sU-VD; Tue, 19 Oct 2021 13:14:33 +0000
Received: by outflank-mailman (input) for mailman id 213211;
 Tue, 19 Oct 2021 13:14:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcowq-0006sO-J7
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 13:14:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea90e40-30de-11ec-8312-12813bfff9fa;
 Tue, 19 Oct 2021 13:14:31 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-BSV9uP-xPGucjqdc-OPwnA-1; Tue, 19 Oct 2021 15:14:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 13:14:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 13:14:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0036.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 13:14:26 +0000
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
X-Inumbo-ID: 7ea90e40-30de-11ec-8312-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634649270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M69N8ZbxezuNVjrG5FyR3dJbltvZLSQ9BF8hIxc9x0Y=;
	b=OjN/y8fzCB6+hKZXbRsrWnCfJsFCXqNEi0zmSCGLOP2voF9TbSp8wLXQplJ5SCLTklwkmd
	lSKCn31RqmX4/u+08lh75iCv1cekcObtpsOMx9/NQOCLvo9YCgaR6l4TXQ7XAyZH4zf0mY
	y4K6CheHjYHUj9HeksxCyNwkOM0DmF4=
X-MC-Unique: BSV9uP-xPGucjqdc-OPwnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esrU5CZGZC52Go8ArxKlsCCPLgRiojb97vdzCYTL/X3wm+I3fCpJgMIKXjZA5lIzQbJiT5S5aCEeeFKatc2ol/Cp/yu+4H6Q9chmaywIL4zFQ9IUpP97bBsiS+2qRZIdwvZUS5PSDgUR9ks3GwYwP5uuHzyyrUxwkwBQKbX7+LiNzI6HBFu3xaLb0GpllfqQ5G0kv6/vnH+fQTfgUqaqYxE6vbVHR2qRXA39/oNcEwPL9J0wAPjBoT1/rZ2fmeZ1sru02ttD6ko6NnWMmbkg4oE2b7PFxnCm0BWlyqHBvhkXdKCVOdF/NrofODKrsJqVTtGXui6Dr7hDhc0/KBXssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd3PzkoGE/6GBdKf/jroNS9Vl2nsZIfpfqb68T2MbZU=;
 b=HVBmlCpRPOkK4IST0xa6XT2M8IOAnaq8b5GIa1txzKfr6neMoy9sfLYKPLKa8RjBSLQLuuzEk1kpYnxm3cSVmSbd4U2Jmqckj8DiTMvG1A9u+QRcyJqVVRixWri+hDx3GumK1DbXfEUfT0Qqyiq7cSCOpihmSHLFgJE+OBjki2ocDDzZLp8AnRWJCbi9Du000vcn0gUOTsGITBe+qJ+7kPBw/Pqb4ODRPKWsfxcoRZYkapS6YD6KjcfJdaTjTyINhQtpaxCu/0v+XL8DhdFOfGpUqyo91YdXUMqhPF8Up55MPfXK1WQj0wj9GbgviuK/fGmRcagoroRg4s9DzmUadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
 <9e444a8b-58e9-ea37-0e22-474e430be5e5@suse.com>
 <YW7BSjF3DD0jl74r@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <787987c6-2fc1-1bae-f9f9-f1c806de1044@suse.com>
Date: Tue, 19 Oct 2021 15:14:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW7BSjF3DD0jl74r@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70499e08-b302-4e25-bc1c-08d993026071
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590360DBE8B0C4895A71D2D4B3BD9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4fAjNFG0f2bAXXLiOy7pC+4odk/MZkS60qTIdSvO6qvMyFBhJKjN3qG/d/ejm97U2OQfhIj/9wMHeqLRfo2bIRkwR//ste1N5oDHWS5MKAQG1uo8B/se+bMa82mTCMiIUT+UnDw27g/x1GTKya+EfMyCSboOAMvw/vFBDcCCD78Hb/6zDPeLyzwqRvyMU0peGLvvyXGPehjFoNohl7+k//Njch8Vyo/AvUB/obzSmQCiM6e2xj5UZaZj9yPqySFC/pvhm36phn24v9Vd3v36suu5Tj/OV/kcHmKtawLQgvFsv06WOGxHhYyRrHA/tuCwRGspxDBfSmH520MOj4EqgAm+NLB4HNrdluCHEJ3hUOBREHel0Fr4lXMweu0nrjw+r0RTTWejyMBQNmGNwCJbIlgTcsJK5ju006HoRSV2SsFQbFtGUSxGn3kxp5b8cWUFrZ7FZANmJGzTKgbZmA7UQ1+Kxz0C76PwpjnCv0V83Ad6UwSXLU5shJt8aca+0Cnx7K7t2E+h6AozSVbKjJXkla4lbvPXT4ocUepACFqPmxgMXQjEf9v2o4kfqb4wSflzuHq/DId8ls5rd78JteImFVuazth2bNjH3mKkHYl8XC5hz9ianj+8ejCDalRAxTn2M/N8CLWGtc42aK+auMrklUG0a8OdSeNH7/lRAfNcSwEbzXAjVgPKXoqKfUWnnBGTljZDwiL9APtW/fX8qHIOxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(53546011)(5660300002)(86362001)(31686004)(54906003)(186003)(38100700002)(508600001)(2616005)(26005)(16576012)(31696002)(8676002)(2906002)(66556008)(956004)(66946007)(6486002)(66476007)(316002)(83380400001)(4326008)(36756003)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UQ4InMKoBtLtgR3aumiz1Ed3RcoKM9/IONqKElkzSx7fLFXcFWZV1glJ2XCS?=
 =?us-ascii?Q?aHApk/CYvPQ3CG9DNpl48rOXlLIyMmKJljwCsV7nuVvDE9l39UCVq8Z4YbDJ?=
 =?us-ascii?Q?qwwxSO7L5WF9CFC6oqYGylphThpyuOX7w0kOXqMYLsmQmTT0u+RNYUFhjboX?=
 =?us-ascii?Q?gyNwxExtD5cTXO5b1LYkp/rlAL6DorR1Vj56kGL1B8Lb17vDtRpcy7Rv6u8/?=
 =?us-ascii?Q?sr3txlZF8+8cRc8vpPFD/zaUtKCuLRkVBM2PJabFVkSk0gK4Ekt6aG3IJc4Z?=
 =?us-ascii?Q?2u0ETJp9iEoz8N+UtlR1l8vaAGsyn4fIRhVuOKgkVEzYTiF9gA+kmSJo/Z/E?=
 =?us-ascii?Q?IFiHW2GKXFHlrrdO+Ujxh5ZdkH3rwsFjs7pnayzkeqxpmcE+Wsj3hX82SJn7?=
 =?us-ascii?Q?TASpZUzgNEN5MbE2TgvXeLBz658KoE7/0/owexSuKry2BA4yol3/xt2Rx8Lc?=
 =?us-ascii?Q?yec2yhZqYbKGPJjPQC9YvnlNeHBKr328ZKvBe9Pw68pTGMewnR7KOOa+1D4B?=
 =?us-ascii?Q?5ABu9Ig4Ua2wc7a7yXpUO7hkkpHYkcsaAYigQZl1T6clgxE3NItpSeKcOVnQ?=
 =?us-ascii?Q?PjUV1nkYKVCP/OU/09FSsmJQHrcTC+BF5xQqAjt2nzha0+BdF7ahpgBrcmUt?=
 =?us-ascii?Q?CkeUX1m0nnMW87JYRDgAhRWdCMiGUYQj30xvt4SNuOXnf8H71JeHVt0NjxdY?=
 =?us-ascii?Q?fe8s3bytIUsVxB4CtY/5Ajia5o6/Y+nK10Hysxe4KsbF2jpJ36sAKYP+lNw7?=
 =?us-ascii?Q?7Tr6YZ3f7y8i3laxvuFKUZDZGTaaHJWuL65nT8N5GWdY8F7Tbbcvruel2LvQ?=
 =?us-ascii?Q?q/1yabSTFWDOxl04Yqpa0vDWLSVRw/h/gRrIByHvNfyfCCCH0xI1xpimmSV9?=
 =?us-ascii?Q?rSJ4hDqQyhLX3EDe4QZ1Z4YF2nAocUqGlkkERzT49l7VRWe2XKtUt+mr9Qbv?=
 =?us-ascii?Q?alqywbrOES8l+XjxImycFvMQwzBumpO4Ld/BWG5aMyuZG2jpuaZSVXmAr7bR?=
 =?us-ascii?Q?R3eIGhQruDP2Yp9eAMIvm7mqjtpcKTo9PfGtmHfi7jZfCl5E+iG9fkV/C1HN?=
 =?us-ascii?Q?hI4lXfHxirVMIER3c7IimeUTY4Zot6QlubGZP9AP+AJRWxdnztW9V3e7h1Oe?=
 =?us-ascii?Q?ahvDT3JZOpqkDYNvbRn2bpbJ/3MbTSsb4jtwprDGbTFJfgm8g3rO6kgtCdMC?=
 =?us-ascii?Q?DaP4N/nICvrPg6s+CEO160QyAp6pK5UMdf4sDxb01n3INUwqzCds8Zu2kDRS?=
 =?us-ascii?Q?AeZ8PyYPMHF7b9I8sLetziLrkt8R4bGl673/Z2BmHcJhM/xTInS4DVRtp3pV?=
 =?us-ascii?Q?Sh+gKrTCkmjSkcph6f351qih?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70499e08-b302-4e25-bc1c-08d993026071
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 13:14:26.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5x8rAgkQbFVows9vXFnAJ5KnAK8KKXDmkCBEVQE59WdlG8IttFpL/BCW7KJ7IgEKqTranDO2zgATfWeflJcCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 19.10.2021 14:59, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 01:58:38PM +0200, Jan Beulich wrote:
>> On 19.10.2021 12:41, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
>>>> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() -=
>
>>>> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lo=
ck
>>>> order violation when the PoD lock is held around it. Hence such flushi=
ng
>>>> needs to be deferred. Steal the approach from p2m_change_type_range().
>>>>
>>>> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
>>>> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
>>>
>>> I'm slightly worried by this path because it doesn't seem to
>>> acknowledge defer_nested_flush.
>>
>> Oh, yes. Iirc I did look at that logic, write down the remark, and
>> then forgot to add the conditional to ept_sync_domain_prepare().
>> The interactions with the real (host) flush are kind of ugly there,
>> though - we then further depend on the ->defer_flush / ->need_flush
>> logic, which is EPT-only. But I think I've convinced myself that
>> this ought to work out.
>>
>>> Maybe the flag should be checked by
>>> p2m_flush_nestedp2m instead of leaving it to the callers?
>>
>> I'm not sure this would be a good idea, as there are more callers.
>=20
> We should maybe add an ASSERT to p2m_flush_nestedp2m to make sure it's
> not called with defer_nested_flush being set then, or else it's
> possible for new callers of p2m_flush_nestedp2m to forget checking
> defer_nested_flush.

I'm afraid we can't do that, or at least not this easily: The flag
assumes the p2m lock to be held when it gets set. Hence callers not
holding the lock (hvm_set_efer(), nvmx_handle_invept()) may trigger
such an assert just because another CPU set the flag.

Jan


