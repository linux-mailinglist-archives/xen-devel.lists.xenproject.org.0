Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80A4B9C71
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 10:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274564.470072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdOT-0000Wr-W7; Thu, 17 Feb 2022 09:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274564.470072; Thu, 17 Feb 2022 09:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKdOT-0000Uz-T4; Thu, 17 Feb 2022 09:48:09 +0000
Received: by outflank-mailman (input) for mailman id 274564;
 Thu, 17 Feb 2022 09:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKdOS-0000Ut-PB
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 09:48:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b390765b-8fd6-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 10:48:06 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26--7-1J0u7MGK6UjpBK542lw-1; Thu, 17 Feb 2022 10:48:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 17 Feb
 2022 09:48:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 09:48:00 +0000
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
X-Inumbo-ID: b390765b-8fd6-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645091283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Fk8hG3xO+5URrFW6ecPKEd1mw8Tp+W0TolQORDmEG0=;
	b=E1BmQf/3KPBFpmQpAbRRuqoLLmasCXjSOANRwH5UEyDj4SkO7x+y/tqSjdvnf2q4yxmi/9
	8Rr3BHhIDUov1JhvO2T+2jvLYG7QAr8Y7d37Wim4i7ZhwFZ4ntiIRlN6T8ioFWo7P0OdN6
	ul4u4kcKT1QIbYfvj0brcp2oFk5VaRs=
X-MC-Unique: -7-1J0u7MGK6UjpBK542lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfobEzO/J7fn22vL2JK+36+j8aO3qumHXfOxyechFVTeAo/GO6ZKgEPNZT2aF4tH5lLtmnzQz0KkwX6WPz93IsjoxPoOXurvGoQTz9ds+YCsCcQ+8b30+N0dhApSGFokYQaySW9EZjvppBsnEL9OSpI0biQWhkKTMSLinWyVusRwety9KUcqsV7PgxFG8jbOSC5WjRMP+zDsoMIZZMpkHNvTXyuGT6UctpsbyZeHoRH5fIGzHbUG7H+a9MlS8L4JVMkZIJbgmMP+ubJUsuIZsd4DSkR0dUjIYduX7pslBIl3xZCM60xT8IkPRbjAqk3FawrpFeM+uMStXR/rOhnhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy0UePrlVTTNcJntfNiuSPcc8zS67fNtCIo5/uA/lf8=;
 b=Y7tvr4szsvXjFj55xwzPiavkhohTzFa/tRG3h2zRsf5W6VihijK8bHJfba57aK0/kWPtZPBYvcLGQ9H7YOpFbh6MC0QJRlmuarZhcXy67YyckoAxjJ+qnQ8EEy4xanIL9LdUZcSIQ9FeHeENC6B5S3loQki9OlBi+IuCd+WJF2QIZbiitZ9jlWTpPknl57leogwG5Za8n6cl+2n/670bT/e5QVbNcxeq2iV2AqURFnBiX/RMqA/TVxcKSwHOZFTcfX0e3MzkX+wZwThSOICb+9PH1rAE4OO6fC/alRZUz307O8ouDXYoA1zhpeTO0M75OTHOMOpjlb90YJfZsvqIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f0e5a2a-9aed-3869-b9c9-576885388686@suse.com>
Date: Thu, 17 Feb 2022 10:47:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended Destination
 ID support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-2-roger.pau@citrix.com>
 <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
 <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
 <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
 <Yg4UPzFk15tJGo0B@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg4UPzFk15tJGo0B@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0051.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2edbb064-6765-4eb0-18a5-08d9f1fa957c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8677:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8677876F44FCC1202FA1B6CAB3369@DU2PR04MB8677.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYIJEsmYtltK6QCqwhN1ilk8Cmzk7GNZSF1ZUNdlmDk/t2KGL+X6o+bMWQ5ky2qCVG2xbcfsW3TDvjuwvGt68N0D6Zq9fSraayah3pU/Gb78kuzlk1fKADQZ4LMBqcpelfB+fldVXOKYDlujozxcABxnZCEeavVX52Z9K0rnEQfUbAffgc7ngjq/4BZHZQX9SJ2Wf8GDLKkBuzRB2BmLoI/xZ9kprVETDzcZSlr6AQm17xQjVb5fmmEpLaX7CL6i0Q0OnKIzPIK4ePhtaovMN52/8TdsYypE9wCpmXQCicmaNo/W5mUJ58/7M1KbclaH89THLVasyYXre2Cm25Wp1oKeCxdszlRYn5MIH+xzb5PfsVEUX3T4YqdV82uRoUkQuKi2kq5laQr4KtqF10Qy6CozPzxUJCksqUZ+EheFImNnppTBMuURnvRhFJF7vxrF14OpvkIYKyVM0VfBvkqP8iPF38JcIEOwzVUOe6+m5JkyU6k9Uuc2Lh+2/hjAtr+OFrbWw+o5QPd5V1skp6yYnC6WdNFx3rN1Kysgdr/BGnX6zeni/t8RZCBO0zq33zKB3XYd5KLZUoTNSQy6S3wDkvHZwTxlqZMHcdtMceyYkpldQpurKexsB81SLRkpT35AxhpQ/R4t7fefC0ePbYXL6ENTKXFMyS7nE8Grv+FQVjvAiXf4xlASjJ0yMri6OuETv0wWu2Zy62NfNKZ2xT7Dn1QDlsnQ8fE0jR49bc2BHoNxpnGwoevg8g3ptFbrTHmX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(316002)(31686004)(6666004)(2616005)(38100700002)(54906003)(5660300002)(6506007)(26005)(53546011)(186003)(6486002)(83380400001)(2906002)(6916009)(6512007)(66946007)(8936002)(31696002)(86362001)(508600001)(66556008)(8676002)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KWtvOhpROX5+xRfs2dsEEEQIWPeKnpwWAPnXAivRcRaQfiJdpyUJIV5C5Cny?=
 =?us-ascii?Q?v3sfHrCnV6MRc65XkHARDAsM782n5cTBGLx4a8gWX6Tt9j2euGMtDM8nqh82?=
 =?us-ascii?Q?n+XalmKbGLzLJImIrKOxMcKuxM9nrmwrEpKSCN/GR4nfscpq1aQYPfF36iOD?=
 =?us-ascii?Q?YSae/mXafuxJsH2uiiWbOWvhOgou9yFCBIY0sVGATQ/RIbH5PhI3zOLYs72O?=
 =?us-ascii?Q?QoijBs5GxMywPVVbXAicp/b4MS12TmahNfhW8MjyRB+FYCEoO4swUV7MWnty?=
 =?us-ascii?Q?kNnSlyNUhSUaDAy081NSfYE0l4vozl3spYs0x+J030BHh/gzz+hCsZQ0j7e/?=
 =?us-ascii?Q?6JHKv3FdCK54QQeQlQ7KU9tBrlrDAy9XC5MBEWNGKfcU+M70Qfi0G7ec43gW?=
 =?us-ascii?Q?Tsc0FtR7P9hXiajMJ2BwA+FEFy1nivyp07CYRJYRdBFp5BI3t2CmXvEOhzd/?=
 =?us-ascii?Q?GetzOMtqVbMfgJsR2KuNH0PbRrxZlzI/vxRUh2/pC5xVBUjsI76tpy8bWwrg?=
 =?us-ascii?Q?f8pgIc+z3bC8l0R2sKV/Ozx9bhlnvrn7tD+AD11EbhJmx3suB7ZyA0nl+Mk7?=
 =?us-ascii?Q?ouq7agNegNUevI99BimTTVm5F7lHhRcHQMhWCbFFjWbJScn5GBr02hTKMavg?=
 =?us-ascii?Q?y0fgK7rT8DUoACz2kfvt5JkVei61SHpb3qfxKJEi2V/2jUEus4Se5OItSMvk?=
 =?us-ascii?Q?7UXqwM/MIdyVXbGhc13XwmVzoDL38V5/r0ZntUg4VpPtKD9BqnOHGcCUi7Zx?=
 =?us-ascii?Q?YYgkjv75L+0T1ekVulg7MvN1eFCqmeokIlNoaLNv1W/WhH8mNA+JI2JmI7Ca?=
 =?us-ascii?Q?miTdt8pDpUFNbJODoEYIZIANr0Pe0WYmoiQj9tR1uPG2vBGK5fmW6RNTlS3j?=
 =?us-ascii?Q?ix5TAPd0UR6TuACJh5obSKQv4Uu7hP8h0MnGvPw1gmUWl9q9hWIGcLlv6/g5?=
 =?us-ascii?Q?6vb3iU4TGOv0j+Ysu+7ioT99u7ObnQCXioNt3tYOxKdCKkp/td3ApfeGYkt1?=
 =?us-ascii?Q?Z+kyfkLyTxOKmd1bIlcfo1agleRpU67F3LvJ9wFpxNjv57GXnvxJObV0tqNC?=
 =?us-ascii?Q?nfYn/OVcqh12yl323Vxcy/rZl43BVHRH8gH7eJA+2+tYuj4kFnlYykATSgKI?=
 =?us-ascii?Q?lPceWrQY8+0mFo4iP6maPdW+cDBT9KUap06kIuYcekw8XM0glQjd88jZbx/T?=
 =?us-ascii?Q?EiVeOBmgMhqOT0224hqjz0OceVPszQnAtk2nHzITUguBwK/+ZGwNVvAzWxuf?=
 =?us-ascii?Q?J86v66gsmEPjRnDMYg0nfexNB4e3Pid0lJtUvE/s7fXYcF8T6rMVnVtJaMB9?=
 =?us-ascii?Q?UiWv7SpI7GcmhMYwV01djCOAkkz7blS9NGFHiBw7AufNLLLECwF0O0nhqLAR?=
 =?us-ascii?Q?TcW3GoQtN5A+ON4XW6kwZjF/HZUJf2TA2XRPbydU1+iL7KPnd4KNWn/ioNwQ?=
 =?us-ascii?Q?zRY2TU0Im9pZC+xpHiENBGw2OkjOVATWb+jKPVubIDrK6cZLeJY1GVNDnASs?=
 =?us-ascii?Q?ZV15ykTMMeLhzlxkaW594saPKogp3aUvf4W++mQR41nZPDqJrmynr6yIF+rj?=
 =?us-ascii?Q?l/8CrtclYXGhLhTKkoQ5Y2qEEpChTtyWGThG3WbYrv1fuwFWFFsc87xc6WL/?=
 =?us-ascii?Q?VE5x3wtwQQ4nUkLFW0ic0vw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edbb064-6765-4eb0-18a5-08d9f1fa957c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:48:00.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUEtHOMSRyG1rdHQucy6+21Bf+AlTaIpZO4XipmRZ81Mintdl9Q+/NJtlUg9Jru0e6OwqOsbsToCmoNg9Ze/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8677

On 17.02.2022 10:24, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 09:52:51AM +0100, Jan Beulich wrote:
>> On 16.02.2022 17:08, David Woodhouse wrote:
>>> On Wed, 2022-02-16 at 16:43 +0100, Jan Beulich wrote:
>>>> On 16.02.2022 11:30, Roger Pau Monne wrote:
>>>>> --- a/xen/include/public/arch-x86/cpuid.h
>>>>> +++ b/xen/include/public/arch-x86/cpuid.h
>>>>> @@ -102,6 +102,12 @@
>>>>>  #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
>>>>>  #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is prese=
nt in EBX */
>>>>>  #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present=
 in ECX */
>>>>> +/*
>>>>> + * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI addres=
s can be
>>>>> + * used to store high bits for the Destination ID. This expands the =
Destination
>>>>> + * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
>>>>> + */
>>>>> +#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
>>>>
>>>> Would the comment perhaps better include "in the absence of (guest
>>>> visible) interrupt remapping", since otherwise the layout / meaning
>>>> changes anyway? Apart from this I'd be fine with this going in
>>>> ahead of the rest of this series.
>>>
>>> No, this still works even if the guest has a vIOMMU with interrupt
>>> remapping. The Compatibility Format and Remappable Format MSI messages
>>> are distinct because the low bit of the Ext Dest ID is used to indicate
>>> Remappable Format.
>>
>> Well, yes, that was my point: With that bit set bits 55:49 / 11:5 change
>> meaning.
>=20
> Bits 55:49/11:5 become reserved again with the interrupt format bit
> set to remappable.
>=20
>> As an alternative to my initial proposal the comment could also
>> state that bit 48 / 4 needs to be clear for this feature to take effect.
>=20
> I've always assumed that setting the IF to remappable invalidates
> extended destination ID, as the format of the interrupt is different
> then and there's no destination ID anymore, just a handle field. Maybe
> I could make it more explicit:
>=20
> /*
>  * With interrupt format set to 0 (non-remappable) bits 55:49 from the
>  * IO-APIC RTE and bits 11:5 from the MSI address can be used to store
>  * high bits for the Destination ID. This expands the Destination ID
>  * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
>  */

Yes, this disambiguates things enough to address my concern. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>
and I'd be fine making the adjustment while committing, if no other
concerns arise.

Jan


