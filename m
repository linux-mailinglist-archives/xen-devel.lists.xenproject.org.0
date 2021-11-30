Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AC4636E2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235176.408035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Gx-0001CB-15; Tue, 30 Nov 2021 14:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235176.408035; Tue, 30 Nov 2021 14:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Gw-00019g-UG; Tue, 30 Nov 2021 14:38:18 +0000
Received: by outflank-mailman (input) for mailman id 235176;
 Tue, 30 Nov 2021 14:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms4Gv-00019a-Nn
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:38:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27591d58-51eb-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:38:16 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-DSeCB5GuNwSjz3pZgSNT_g-1; Tue, 30 Nov 2021 15:38:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Tue, 30 Nov
 2021 14:38:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 14:38:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0337.eurprd06.prod.outlook.com (2603:10a6:20b:466::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 14:38:12 +0000
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
X-Inumbo-ID: 27591d58-51eb-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638283096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huQ/46gZdS5axDqJGm5iFZKD2ZQnr2tZ+NgepjjW/LU=;
	b=VgPFEyXYvLj3w1ds30HfrLE7sI24IKvyDzf3tU7JEzcDenvq3/SpsRkxfaGu7k7jewmYU0
	zVx3wcfjzEqsKWZKVRqOn967YGcLVAB9JMLxUfUrTVw2L3/gnGTr0mRdmeH8CMkp6lSsPm
	TcUyaTtePMUT4gj0QgDO92KQTrQy2YY=
X-MC-Unique: DSeCB5GuNwSjz3pZgSNT_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yw1J0NKQx/PSTz0IfGUmY1T/VGuKGZeCwyVYqwkzKR0My9CqwERCsFMIgAImv6lcbEB4+tJXALisLH3K/trMSfqj8xwoKfNYMSqxPE0vwNko48u+POzK4Ye0pEYDoKqrgfd+EjMZz+LtaD4+0uf7gFzAj8cz9YeEXkTpXHdNd1bV4iPTAUrFXDTN7EB8dZShQVbY76j5/Jd3MhaeEXfSiT2yYBPEYcj8NI9/HKxTqiV5PW03wvMOzIffOBzL5GqjQT7C/wugAtNvZXZOrotDz3PDND0gPL3ePa2Z6698pAteELLyyDpdtgLTSeX21I8aKVJ8W6vbTwg/Yay3A8z6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbla6r+kB9qZGOZaj6QZrwnmYPaJKjFJqfffD203A4I=;
 b=MmkQetRa04AXmdYa6hbm8SoFcrzN6qmOCVOSKDqf7qeG2KASZjvefpfygcdQAUV9zt4dcfAQwriXwodzDHRc/k4JFH2USIEt/j5Z1A3Ij8VZOtXpUwy+vvVelZRK54+1GV7Py8eGd3lwJ1nuzAoSlBbxK8xbcRITTk2e3T0Y0EXXFCAFOQbLoS5OSIhbBRWq7+bkiijXuYrwjkZagdqK07S2aQaS4xNrqnBsDMdYp5VBDVGyWX+QckQcQf4dKWaRJBHv5diwNpOWU0VYz53OMw6zfi52IN9IDilK7jkK99xTEg1JSDgY5alUZd5Qx7mJRJp+Azz8xN+rISf3p/qmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a17f9eb-a06c-e741-b056-05622081555b@suse.com>
Date: Tue, 30 Nov 2021 15:38:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 02/18] VT-d: have callers specify the target level for
 page table walks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
 <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
 <91745efe-129b-4851-87a2-93eea8f6d63d@suse.com>
 <YaYRVfa214KY7P+4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YaYRVfa214KY7P+4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0337.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657340df-0d28-45d9-e5da-08d9b40f09e9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293A8DD8B1229046823A1DCB3679@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Y9FyT8cN9jP78vz6U+WczyRKwin/pL8COVSgpTEyzXwLWLcivT+lOS1Orrpzxazm2L6a2CeewNJqctN8x8djFIFteRkPmckCxAhJRMm/FNrM8pMVUP1jUNc3DJUs4SS+gNspQMZjIWl9njJ2QZzUzamYGwaEgmii1+JoQFplT7BXOLbRc0KWRov5+EWEl5WetdUnqaZW9WIcIlszKDttp+Eh5PUBrzaqPcIGzoeJRkMocOXsTZIxp4kxMhvvvwGdoyrdKebPgX/dFUFi3GXQFoTOhea25REDolYCNz13q4gDEfcgJDp/ZYBM25ZbDlYcbJvSM3Esc2NlwRH2fT6zR+N+p3vQ/+0Oi4PnQA0f5paJbweX/9qhhSWCoSh1hKPWKEtnIDXNxRcXOjA0WiijPc98O6XUUktReluLcffW1pQI8t/w/9mHg0uvibw+vfM0Y7PX0ZL5aM0cve48q25hYtyZIvzYgVsZlg9YEMvuXybyTN4o48bQLRjbcMkeafIbKEzSCYPgCDl5+bT2jQ1BPjlBRm9XFzjtLUIgRdDjHRTpYDb1LhpbGzj9sJhSi0v984JhgzcLmsd1QpswFzjYFCwxyCHgEsqpSv6Hn4YNFafQkMryEcgintsknAFO9MQAOy4wfiNFpcErCVj8KOEHOg4RQbeOwlj9wTLFhHHnTOuRmSqmWJ4Lgjv949/4l2dGbOlgCjzbmfxbmLcs86N4jSdYzWtU2W1M8AVCk2lILeb4xF89Y83hL1vfLoTL+wL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(2906002)(26005)(956004)(186003)(86362001)(8676002)(31686004)(38100700002)(4326008)(66476007)(508600001)(5660300002)(53546011)(31696002)(66946007)(66556008)(8936002)(16576012)(2616005)(316002)(54906003)(6916009)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J6fS3/u9PSRvLMAmQF3A0myYvcbTbTarhKxmnCYEHkATeWGkeT0oPQrOlSXE?=
 =?us-ascii?Q?WfiB/1KupAh6YHpf9hB4kpvhnhAFeSZvzxKbCf9pKJorfWexh13J3QoZmvaD?=
 =?us-ascii?Q?D1DCGbIVm93MHxEV5eN+JWWc5EhejH0huLdipGvzw490oX8CJL1MeXCCTl+/?=
 =?us-ascii?Q?s7W/4KAO9Mgx43suOFCrA2dDrVmiRX6OxNaHNoQAmZ/C1KxRopo9a4YgzJhu?=
 =?us-ascii?Q?ueyRS5YWMfzNOk6Lx3Xm1JtYKc0g/8hoEMvrAHWBNXn0xdsuaurIdQeyX8+i?=
 =?us-ascii?Q?kDfAB4OHrlf1LmbVeuoPqJV1crNZ9C7fg+ex0QBpEI0eNoHiiFpy5HPooyfZ?=
 =?us-ascii?Q?bn0qDv3eyVq6I6av6mtsFA2oJoJzQAQ6tE+3DirtKysruslVI/ztoSbdQ2Jm?=
 =?us-ascii?Q?Xh7Xr5g9VTdgm+WYKns0BZgzkZ9vleO0AMLnHzJ04p9OY5BhnwGBXG7F72su?=
 =?us-ascii?Q?RJzdWWcnw2v5l/JErFx/S2X7+yeUvfgjkE0BKwnfyNOqX6nUBOquC5TarPYE?=
 =?us-ascii?Q?zwBZOc5Oij2L5I2gsWUdwjhSsEtBKCwJnktcdE1aGdElVhCN3rihSE8Uzf53?=
 =?us-ascii?Q?L6OjDbQyoMFcUThZgdWK14/JGqJ9woOUxg2RKP0TIzWChLnNv1gobguS0NH5?=
 =?us-ascii?Q?jWx0HFVfOLIa2649kDo6IdLUhKYXsCop/asrCE2T2I1KNgffcmP54mQcxrs+?=
 =?us-ascii?Q?FmV4JgOuYSObqNDXtHeJnhHzSmDXwvgFYt3UbBGv6janedz+YJF79QxqUV39?=
 =?us-ascii?Q?AmdqygqdIblPDx1cz6V+0AMtVOWh01t0Nm75V0udUTCyPPQOO52rlVJNalKQ?=
 =?us-ascii?Q?b0AB4SyEJ0VSNVicczMZyadD2jjs0W2LrODJUBWRDS44AtOjoEhCwzTHfHLP?=
 =?us-ascii?Q?tmiaesyb5C41gujvJnx5bpkAQN74qCRPGI84c8wPwrniS85wkpeQIF/PYNj1?=
 =?us-ascii?Q?c8kB/rPsH8an7Uzfj1Ba+oB1cBanQpTD3zTH0ywyqCYjBocbJJ/8oT3PCCgW?=
 =?us-ascii?Q?JKkWhJTEehL/rv4wgu9Pvjof2GgwkCQEGMFHcqkwGfTaIIe3978yYzTZmbR0?=
 =?us-ascii?Q?uUoz0mRgk1SaOWW3JN8Ae+f42k/3PRYDb3l1z4t+nt30fxG9LznsPFz7MksR?=
 =?us-ascii?Q?R4pUJvsBrIye0BGfdP2y0L4HrMjOzawgo1qZ+tYKve9Gw8DZuT6Lq1wpTJ+Z?=
 =?us-ascii?Q?zEEsz8HeHOQKOrHPUHmtlef6c5SeXLYJ0LPRVMlcdIfxGe6iwj4MGgBu5pZL?=
 =?us-ascii?Q?B1HJMQWyhI3GuIJphOGxuGEJNkhH78lrcsQ/mZcXfgSZsUzW83DhdanxiRot?=
 =?us-ascii?Q?blIKpb/r+/XZoh3Vr8yG/CWoSlIXYI5USMb5geuv3ZUpYAL1GFxeQYfjtFam?=
 =?us-ascii?Q?bplm/F4v7j6+ya2wxTnHFM06O8MrfVGtf1tsw4ximOzd+tjn57+En3c7U17w?=
 =?us-ascii?Q?mL8crK6cQUiDhjp4NQ0Xd0i7bcSmAVxaXczpjR/htsLrx/PJrrY6BE1ekgJq?=
 =?us-ascii?Q?guwNnoWvrkxPDrm0gZ96HioH8Y7NQNxfEpPtP7Oop4V67k7CWVBHJMIi0KiZ?=
 =?us-ascii?Q?SI16V0KftCtcM5dsjQpQ+AgIgsLyvUxGXJdxQMtf2vla0PylpLU8VGUSxQku?=
 =?us-ascii?Q?dXFVkBUiz2sPvk1KycM3Sbo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657340df-0d28-45d9-e5da-08d9b40f09e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 14:38:13.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeCLxo/NgRjZjUf4235zFgnNM7qkVcMyeGOQ+xVzVZUNg/q1Lt6m7igrwzXEqGc+4uYVyMbA8b2VcMiZ9PqSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 30.11.2021 12:56, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 27, 2021 at 11:04:26AM +0200, Jan Beulich wrote:
>> On 24.09.2021 16:45, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:42:13AM +0200, Jan Beulich wrote:
>>>> -    parent =3D (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd=
_maddr);
>>>> -    while ( level > 1 )
>>>> +    pte_maddr =3D hd->arch.vtd.pgd_maddr;
>>>> +    parent =3D map_vtd_domain_page(pte_maddr);
>>>> +    while ( level > target )
>>>>      {
>>>>          offset =3D address_level_offset(addr, level);
>>>>          pte =3D &parent[offset];
>>>> =20
>>>>          pte_maddr =3D dma_pte_addr(*pte);
>>>> -        if ( !pte_maddr )
>>>> +        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpag=
e(*pte)) )
>>>>          {
>>>>              struct page_info *pg;
>>>> +            /*
>>>> +             * Higher level tables always set r/w, last level page ta=
ble
>>>> +             * controls read/write.
>>>> +             */
>>>> +            struct dma_pte new_pte =3D { DMA_PTE_PROT };
>>>> =20
>>>>              if ( !alloc )
>>>> -                break;
>>>> +            {
>>>> +                pte_maddr =3D 0;
>>>> +                if ( !dma_pte_present(*pte) )
>>>> +                    break;
>>>> +
>>>> +                /*
>>>> +                 * When the leaf entry was requested, pass back the f=
ull PTE,
>>>> +                 * with the address adjusted to account for the resid=
ual of
>>>> +                 * the walk.
>>>> +                 */
>>>> +                pte_maddr =3D pte->val +
>>>
>>> Wouldn't it be better to use dma_pte_addr(*pte) rather than accessing
>>> pte->val, and then you could drop the PAGE_MASK?
>>>
>>> Or is the addr parameter not guaranteed to be page aligned?
>>
>> addr is page aligned, but may not be superpage aligned. Yet that's not
>> the point here. As per the comment at the top of the function (and as
>> per the needs of intel_iommu_lookup_page()) we want to return a proper
>> (even if fake) PTE here, i.e. in particular including the access
>> control bits. Is "full" in the comment not sufficient to express this?
>=20
> I see. I guess I got confused by the function name. It would be better
> called addr_to_dma_pte?

That wouldn't match its new purpose either. It can return an address
_or_ a full PTE, as per - as said - the comment being added at the
top of the function.

Jan


