Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C719F3FDDA3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176453.321094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQsO-0006II-DN; Wed, 01 Sep 2021 14:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176453.321094; Wed, 01 Sep 2021 14:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQsO-0006GQ-9j; Wed, 01 Sep 2021 14:06:04 +0000
Received: by outflank-mailman (input) for mailman id 176453;
 Wed, 01 Sep 2021 14:06:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLQsN-0006GK-7g
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 14:06:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d39c2ae-c4d0-4bcc-9315-8e38495a13b0;
 Wed, 01 Sep 2021 14:06:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-JttB8YdOMda894Ng-kwk_Q-1; Wed, 01 Sep 2021 16:06:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 14:05:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 14:05:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0014.eurprd09.prod.outlook.com (2603:10a6:101:16::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 14:05:57 +0000
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
X-Inumbo-ID: 9d39c2ae-c4d0-4bcc-9315-8e38495a13b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630505161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqWHal1kSmpABLmnO9tkjLbFQHGNQcZ3wuTeZ1Bs8FE=;
	b=Lcj9sV3pBRA0zGtf4W0Ew+Em84AJDGPr9Yycxb4rvQgEOP1wc97tZg5SM6EMSWjUdovBfh
	BagboJcsrCMVLwh6XgC2oDlfMhCWETGXBCSlFONoO9Frpw1Hotei1XHzdGcrm2syRw7TAU
	nzT1mxQB8uw0t/ZwIk6JRSPWksGxkko=
X-MC-Unique: JttB8YdOMda894Ng-kwk_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjUHqOWzRUNL9QlCkm1cLKLVBY7B/lLKPtbKv98snqghPwianmnh9oZmPTzAT/4cCWzz/nYacZBUTkl8t9x3onMCII5hLJWwf1Mrvh8BsosvImXZ6wies1l4tDV3DrTj9ZDv3UqzHPe0YJOUWlqwltfhxmwCjRFyM71ao8pHaUrjNAKX2/k1DUIEWnbiOOgjMbaRawkgIHNvBJVPHURmv5EBN66ziU0zM6oO1wEpPBdZ/yd2Dt9U+zM96Qlxill5E8iISlPtwI6ghGBK+MIMurbhHzfjqGQV6ZklQ23SwOO4n34tEaIl8eTfN7Fi7JTYtPipui9f++7qNWPl/ccjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paypqYQBXso7iTGQUkcCymonj0cg77qB8rkP+sbL1jE=;
 b=XJaJWGwmZ0Fra57Se5qp+oxp+ioxrkkfUGwGcLj/SKE2Y1hjDRGEMiiOHPcOsv67Eyxrfr08r3vNvF6ly+eLWruQsnNlkHX/DmnzQNADLKbdMwVrCOB1A0hTwDXpd1qrHsOF/wEBspivdoZleEfl2vsIesTrBM/bV483lNbZ+cRa956YJC6v1VIrHIcKVrb4E3HK469E6tBgdQvTTLuZcr/bSwqTdwjSDn+IElonWjYHf9HVnZDxVuwqAv2WTYLoGAbgdyzN/6ryj70iBhOIz+LCL4Gb/XLHO0ASpWAWI1MQRDFK/jvVJON71ORBYUQHvelFMlSS60YsgXDeFkXH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
 <YS8+72EY4FrvSSIx@Air-de-Roger>
 <ca3a9559-b95a-3b32-781d-2a2abfa50dae@suse.com>
 <YS+EqCZUAsT/WTBX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9682f7a9-7c67-a9c3-0345-11c110193f52@suse.com>
Date: Wed, 1 Sep 2021 16:05:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YS+EqCZUAsT/WTBX@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2PR09CA0014.eurprd09.prod.outlook.com
 (2603:10a6:101:16::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ced71f10-58d2-4911-befa-08d96d519f46
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598C5AFF1BAAEB8795061C0B3CD9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EZLZdJpqAVRbmzg9G42NNm1xuYil3/cWALCsrqLJQUGHrRoL6lXSdGtf+bUFDqULyGCGi1dypTHUItVMWIvLOjgWWr3zOitJhpaexgf/QsddFXK8RztFBrwbHvhu4xuZth4aR+PTKEIkaqedxYKACmUVUI8svOsusbfYCAkA6FofKcszQH2Mlceh6lnINn7TadtpEW8+BCbXxEZYtTrmRDxXKvgxJq0M/R5KLHYDOD43fZava8uWQszCQ8g5ZHtNZtv5X2S6n2XJx2Z7Ixj4oQVWtkQCj76gJiXSNgi0P5AvJTJv3JNfffyaiD7oWHEU/X76C3gR3qaHdOQsnabDAb1NiRufW4pLgrsN0i1lfxuFTe2V1EFOMZAkPmiqH0SadT5sWp7sYBCXagriuvNM8lW+fz7+a5oRvW9ALqsf8IzbYqcrBQngKYSD8d03/5poo0aMBLdY8q5KuBXHu//2NLRtiQwUsPaz1R8BEUSKKE45QcaInit+D0M5eCT1OGtVexmcNH1ejHkgzcqEHeQH5EJJgEzHJXAD/lME7ifk7LYNP0CnTc5ulHHD7RdAZGfvoq0G3p1/7oX0ewCUIY4D8RDdtD+kzLFThmlpF0ZIExfqt1kG1g3kcYs91wjhw4OBI6Sokd109T71DWe3WoBhJA4rZqGh8m/vYC55SLS1EyH3q269+gwnPoExwgdV31GSqtez5sIgEf/v+T/ujGrwhzdbHzJNaAM/I3u/qETxa/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39860400002)(53546011)(38100700002)(36756003)(8676002)(6916009)(6486002)(2906002)(31696002)(186003)(5660300002)(8936002)(26005)(478600001)(956004)(83380400001)(16576012)(54906003)(4326008)(66946007)(66476007)(66556008)(31686004)(86362001)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uCsrbEH13C/c88d3uq4WMugelqd/tgqx8vOTlnitcyd7XT7sis5sXqXkjz6X?=
 =?us-ascii?Q?uz+gsdX8kwYNQSk1hIdpI3B6X8+lbIkSn5zBwNt83DmTwaIYRjmDFR32zBZ+?=
 =?us-ascii?Q?n5aKlvf9SEfVlD+2wl9sv4XrSEjeWTEspHfbKETP+xOc7X8lwek3ffO4zQk1?=
 =?us-ascii?Q?kgoHjWZbdyu1DmghlOsfkM9xfqLkP1F8KLqkdmbtT3gjuvP+b8vwOcRlO3Zf?=
 =?us-ascii?Q?MWtehunU2QFzfE2BAPEPgAg7wh07CQlD3RgxNqm3dj0ARpY1BTwhepwN5Xzk?=
 =?us-ascii?Q?ZOO9FzMxk2svd4nZG7XG+GO8O61IKNNaCfhudRjCq+RagiNBNIVWGd5cNolP?=
 =?us-ascii?Q?iz4l1L1YJ89p9nZl7djTAOeEyNeOKByPydq51UuRAj5X/uVYFHu10vSK8R02?=
 =?us-ascii?Q?bJHsEu2CIKREJlD+UW1BDZeKyMlDJLBLUJc/U2eOqS/e4idvAFXajFMXU/rX?=
 =?us-ascii?Q?aqAkPCSszkzZ22gAEsdWCCb1iuZV+s9XlI+wre7f61H8tCUAGQHYQy3Y/Y8Z?=
 =?us-ascii?Q?Biqk7JHuayLbyKE1iuqyQrEosUkFuIvJ5IUYHKYw+1BsxSXdbSPy1hrRahqI?=
 =?us-ascii?Q?N2/4/35NIzZsmQyIqT5cN5gTl6H1WR0R2SSZ9rYkfQ1HUE2LYa3+71JWlSgr?=
 =?us-ascii?Q?FIQl9j1vlzpOOvz/YXHaw7oGPABe9Bf1L+HxTQwEpjIf3Poa2JNMO9+5HVDz?=
 =?us-ascii?Q?S7sEPEofm123O1Yvf+4kixlnCRydsDmlQUuYK0CAK0fs7RN0z+wRyq5mUH7P?=
 =?us-ascii?Q?l+Uv6bosyXY5OBl7hokjtzTVIB2OCzhDf8g/3/ZriP0gKJ0KJ3tiMNkGSqAz?=
 =?us-ascii?Q?6tN/zw0nAnXHFigmUmCQhYgDQbYD4nD9j3RXkhPehO255fgPjXrsw179GTmT?=
 =?us-ascii?Q?dlb0mI9pssDUjmuAiNTgdBN3AqDNcYbL5X61NLTHqsipiA+5nUn9BVScDNaW?=
 =?us-ascii?Q?sjb10rOAXaW4cFfPzaXjYiZwOOVeSBELIX+dRBly4tLo9e98Wy5U1vn0RJrH?=
 =?us-ascii?Q?5FsdMk64ZxnYU0yHAhZyfheAOLSTV74+LfglzpPdQjuNqJaMoA7NacAh9dlq?=
 =?us-ascii?Q?t4tBDOeW4ZOSVta5U0dQeLxslFWPpXUuchUyv7+pltKdhLtHn1ZEVwyRm4EZ?=
 =?us-ascii?Q?6Jl1es+4Lg61QtZ65GRi1JbYeyD16ToWgXmE8R260tLvo7fU/e8ULPDW0WAh?=
 =?us-ascii?Q?pruFU0YjmzFegj5zQuHzVv4SmKWRSoGx/XeH4geHOZi8iIbHAmO+bKfHgcM4?=
 =?us-ascii?Q?44ojUC2TA2Yn6gwP761sjmLk8kHk7TqlZYZTVsjdV0F6fQK2LUJnSD9mfGQn?=
 =?us-ascii?Q?v61AZqsqqJb6VSO0rNG3TxUp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced71f10-58d2-4911-befa-08d96d519f46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 14:05:58.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JS7TxIV/o/XVTPfISXZ/b1gdduJfVPNhbJDlX52dp6npQ45YqbLIvt5nVtcNVH0sMLQKLyAXNPxNUbsizvOkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 01.09.2021 15:48, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 01, 2021 at 11:53:03AM +0200, Jan Beulich wrote:
>> The issue isn't just with execution, though, and as a result I may
>> need to change the logic here to also include at least W. As of
>> one of the XSA-378 changes we may now pass just p2m_access_r to
>> iommu_identity_mapping(), if the ACPI tables on an AMD system were
>> saying so. (We may also pass p2m_access_w, but I sincerely hope no
>> firmware would specify write but no read access.)
>>
>> Similarly in "IOMMU/x86: restrict IO-APIC mappings for PV Dom0" I
>> now pass p2m_access_r to set_identity_p2m_entry().
>=20
> Not really I think, as PVH dom0 is the only user of the
> set_identity_p2m_entry call in arch_iommu_hwdom_init, and we should
> never identity map the IO-APIC range in that case because a set of
> emulated IO-APIC replacements are provided and those require ranges to
> be unmapped so that accesses can be trapped.

Correct, this would be only a latent issue for now. The code passes
that value, but that path is not going to be taken (until, perhaps,
a future change).

>> I suppose an underlying issue is the mixed purpose of using
>> p2m_access_*, which possibly has been against the intentions in the
>> first place. We cannot, for example, express r/o access to an MMIO
>> page without using p2m_access_r (or p2m_access_rx), as there's no
>> suitable p2m type to express this via type alone. We may need to
>> split p2m_mmio_direct into multiple types (up to 7), I guess, if
>> we wanted to remove this (ab)use of p2m_access_*.
>=20
> My main complaint is mostly with the fact that some MMIO ranges are
> mapped without execute permissions when mapped by
> set_identity_p2m_entry vs map_mmio_regions that will map them with the
> default permissions and that has execution set.

Right - as said in a reply to Andrew, we may need to drop some
p2m_access_t parameters in favor of using default permissions. But
at least for AMD's IOMMU-unity-mapped ranges we will need to have
a way to express at least r/o.

Jan


