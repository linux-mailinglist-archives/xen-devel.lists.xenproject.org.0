Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40F45D82D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230833.399038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBti-0002dN-EP; Thu, 25 Nov 2021 10:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230833.399038; Thu, 25 Nov 2021 10:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBti-0002bF-AO; Thu, 25 Nov 2021 10:22:34 +0000
Received: by outflank-mailman (input) for mailman id 230833;
 Thu, 25 Nov 2021 10:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqBtg-0002b7-OG
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:22:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98ff33d2-4dd9-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 11:22:31 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-8i6S1Q9LO2a9es9-MoFjeQ-1; Thu, 25 Nov 2021 11:22:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 10:22:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 10:22:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:206:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 10:22:28 +0000
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
X-Inumbo-ID: 98ff33d2-4dd9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637835751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHZDEpk52S41gvZtri9JxF/H2yaYJkiyT77dQ3nfTko=;
	b=OvhIHnHXv+iS/Yv40bPUzKu8Y1mt6Ft49YollFoPn34F5E3w3o1wN1jLv7UIox4fx0go/z
	LE+0Vq2w/Fw6tQCOb2wPvN8tdqY1FZYPCRutswuenOIyPrMB3DD4wRyK3irWIwWurkvG17
	0n6+p90uIdg2dVnYTOCEoIRGMs/uUW8=
X-MC-Unique: 8i6S1Q9LO2a9es9-MoFjeQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOul+owUzO+2H9R5d35G/gzqJCKD7RsMzV5x3gLvwqPunF6DwXuBeopQFxU67UnsgpDHB4ZJA8dCaI7xaHPq25gEk4LCpJJy9O/3OmR2F1QYQxpt5rkvNV4C56P89WytBxoRzjTrbZgugbvPlpGbqa66Q2g539UVLeAq9czHbtBW4PKZnErUedh5BQ1WHrznGulHeQvzQ00tqFVsA/jqHhk0dKlHe2JNUb3L4wINAXvi7NPywTNZB4WQTEaWi3lz1Hy++EKXzQyiPcxpr9uINkwQMoZM+S/XI9IB2duuvKiihWPdwc/5O+wPKfzQQxDyV7+JT6BFmAXoMoE04sdfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dh3Y2cWniyTxg12/W2QwMG2KilPLOccv7Le7RAz3i9I=;
 b=ngHBNvY8ZR2wl5fKi1xg9fpAnjfz07LXCw8BRSkwiGHVn+iarOLt8vHoKRd9qNJf139wi9g/tzbXhX9SyMSXBIQGARKqFzTVLUTavsySCaTutX37+pYb7Hap8FRWcsG4vxwLaoU+mBeyiyoFikFraNRoK9k/p2EjxNaQ7ULK9jN2iRacN7YfkfAHR43ZxrCXlPuRM9oOll6YABlsRpN1RGh7i1isvjEkAbMp7c6WFxEetaCb86dHzuCK+cfedE03di58F6i9K5StiowF5fnde58Viue4eExRDAiUWXHzgs9TT30H5fWqj2X5pY0g6J9XKtBmF9edMtnI0wJqhWkDaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71e1ee43-33c4-fff2-eb0a-c68d3bf5d25e@suse.com>
Date: Thu, 25 Nov 2021 11:22:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <cbe791cc-848f-8511-6974-2c9e300ea66b@suse.com>
 <YZ9WSfy3pYp8uzqI@Air-de-Roger>
 <614efba0-a3fb-7ddf-1fe9-d4fe2feb21f2@suse.com>
 <YZ9iQg4Hoo5Y6kyv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZ9iQg4Hoo5Y6kyv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:206:1::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e14cb9b-2534-401b-3bad-08d9affd7b93
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3391F72DD9B31FB6D7CE585FB3629@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V19Es7D+O1dhZntzgvu+XFgrIJalu2exq2OBILPVDXxMtZ/N5bqPKJDJoMrdDosqregEHa8UwNlSnZ8Oxnlz5Zjxllh8FOzVFwtjfZil+pmiwe6c0+VLV79iASUdnKgT+E1nHlv9I8dWSPqUP2Bbvtxrnrjy789yZZEni86/r4HDKHExgKcgPn84Qii84OpPoWlZqw9ENsqtAQ35unUqdsDPHRkRTNsSg2Tplof16CDu4Cqe0wkSNLk7QxbU9tyjmtr2EYAsE4S7/u9ng22zU8HB9VOeWXjDAh5NiYRFBFJ8YmILb2QOgI3XdNIO00SWiD3YYdwOOjl2mqO7BqYQBFph2m11mDxpkORHRxitX81+GsZn+7RD9PnST1a0V5Mz3LWuNQ2piXBiAu18o96zo8WS3eJ7SghZyqtOZSXVD4P/0XQtxikSlQcJ6vgJ83XXqBRDrkkroYfkIX8u6UFRPd3mMcPnmFrG2FxW2Gyg4w4hI2K9TgpII87Mm79RDTunqUx5fgiBnh8zTUzaWkZSzL0vQCh8sIWTVJVz13Bjbok75TyBHpujgfv1qWfgsa6oO6T01PVQZiqrtr4OOu100NTZyh/0kOy1gOB4VhXyEyVFrOmQu+2woLl9FwH0uGwc6CD8jbDau9GkkR/6RWKpjxD6SXyRtBNPLpzE9rD5t24LGpwM0Yt4dUtyw5Pb3G1Avd1PMx7uLREVru6odkN6Ad6Bwt2oW2dFLe6s40gYCSVq9StJP6pSrPpa19iM/pzzdd7qxIBBmlDdn6rocTzVMQ6J9MULZzjH+2Y47BfLZsfQsDqo7xwcgpjkdM3HBRIkRXxpOzYmbDkFy+7sfT+WMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(2616005)(956004)(86362001)(2906002)(26005)(54906003)(53546011)(5660300002)(316002)(83380400001)(966005)(31696002)(4326008)(16576012)(508600001)(186003)(8676002)(8936002)(66476007)(66556008)(66946007)(6916009)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rARnY2snYSMo2Td7HeWwvdFzw21THs0LJiLYT4/PhK6Vfm9Z57NAgvbISDg/?=
 =?us-ascii?Q?pS7Y5UOmiFTxPtlcEa4s+Fl0Bb3/UTHqafFUzO6KpO+uk8S3pixIqewgk5mR?=
 =?us-ascii?Q?jfFQfws7kJd4Hs7yrQUC2jGVz0xfhIoT5G1xoyBr7bPlFCe8oIXxr/7uohsz?=
 =?us-ascii?Q?k4qZV59nWVhf1ij+0P5SQSVpAEdBhA0xkvCS2hj7GVaIq2BPgG14uCn/rHNv?=
 =?us-ascii?Q?ILGDtCeHu4HklfIifYHAi3LhJh8upesiXzPRx1vVOpjktu/mzjiXVFsUnwCw?=
 =?us-ascii?Q?1/DnNPHKTHPn1QCml20nJq5VBbSDk0uRJQMRT5rq9jbj+Gx3nxC1w9ca2gvL?=
 =?us-ascii?Q?QLo/ZwQ+ddGPUVuIScxhiFm/4kWd7vJmDynvp/UXkxntqn+ILJuOzqLDZPYy?=
 =?us-ascii?Q?EDdl8t1k+Ww9bP6jJjXnXYhegc8tYOE82KDHMIliqJtH48y9pxlkJI4SACgZ?=
 =?us-ascii?Q?Vx7cTFz+poB6U3BAKiy5hvSTkHEyDhJza8zBvO3kvEvljs5BJp0ClVYXfGHV?=
 =?us-ascii?Q?y4Z7QjWNKDH+NU9VL29JDsRyfqz6FLtzi5FspGc2v9fFi/WT6fSHaai6yk6m?=
 =?us-ascii?Q?EJVAgDZYP0wFP0X4w5iJfew4wkQ/rLqbSyUdk7TXB26NmT3mosCmVpRm4Km6?=
 =?us-ascii?Q?M8AMAGiJpRjdLt32vik6TF4M2HfRfvCZcASydYbIcofy9f6UAqyRmQk2m2FK?=
 =?us-ascii?Q?DkLlSlFQFWUpDsrCGKxeB33aR3Y4AsO2TtmwVBjzivaCmMw9eD/jkak5D//J?=
 =?us-ascii?Q?JmiS1ciYdbzT4KRR3X2P4pGG4wFWGdlc517E2s1a2vDsZu9MYbO8ZGg+rXRZ?=
 =?us-ascii?Q?4yBXQS/jl+MsuFvRy2A0Di44j3RF6EUUaZUEeWvitupoVbxlpcftx+LOEGcL?=
 =?us-ascii?Q?6V1yT6hlFZx7aVpLaL7nU9WyrRVxG1FV/N0tYn+p5jmCAk/t+H4RG4Syn0xP?=
 =?us-ascii?Q?xpShtq0Xj1Eel76UgBuqoPzqYHQ10mVkvJt+qZfzF9iB+ReyA4dDs4KLWqjS?=
 =?us-ascii?Q?9jDKoFkjyCzO46mQ2qgtyjeK55HHDvPwHWvGK+sZwCl/+qRfHJTbPVbQeIf/?=
 =?us-ascii?Q?zmlazE4fYZih9Mf8T1Xpc+Gsz5nFCg9zsTOB+pe3o1wmQj4nvgx7LBYWp8BB?=
 =?us-ascii?Q?Tp9jdrAhVj2CS+0OG+ijWjCpsmWL0zESit2+1uvLY7nGPaTgoxTwkgdVK0/X?=
 =?us-ascii?Q?6LBUwGNw8p+A2eDyR2cXcQtdG+MKMWwN7TKATVRiwRYAjzDe1tfoIPOmwO+g?=
 =?us-ascii?Q?o2WaQZ1w7941jiAa5n5Sq3BDhd2tv9w3ar7+mq7ONr61dvkJgurZYPfsyFFJ?=
 =?us-ascii?Q?NfzN5RTnOddm4y6ohVODxD1brVuK7V8L6NWNajTJgTpwKSvgUgF/KdfKwZcc?=
 =?us-ascii?Q?wXICRABTexyj+l/zqm0hpx4zUgV5WVJct/p/2RMCF7WeVETHGfzRRY0RXRDk?=
 =?us-ascii?Q?vCgOuWOuh33r+KuyTCwk5D6JrQ4oDbbSExgd58uo6gzprlKq4tjraiL5+tdn?=
 =?us-ascii?Q?PWZj9lIui+NF9kGDmKscZXPbUJf59LR5igeNsDC+vwrlcK3W4GndCoHFsQYi?=
 =?us-ascii?Q?+QnAhMf1xkjuZ2UqD6sOxOTRC6ndole6I1QMOvAc8sp4AB1J7awEYV0xBpy1?=
 =?us-ascii?Q?EgVTumxU79am50xZAjNaovg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e14cb9b-2534-401b-3bad-08d9affd7b93
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:22:28.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5g1x0RI4Nup2Vz6/gfnjf1QCWFsRSouiSwjbKzXEcHWM1gjsS8iV4ILzyYHGLwvzG1QnszcxwhIeBuRQffJeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 25.11.2021 11:15, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 25, 2021 at 10:52:12AM +0100, Jan Beulich wrote:
>> On 25.11.2021 10:24, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Nov 25, 2021 at 09:57:31AM +0100, Jan Beulich wrote:
>>>> On 24.11.2021 22:11, Andrew Cooper wrote:
>>>>> OSSTest has identified a 3rd regression caused by this change.  Migra=
tion
>>>>> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron=
 4133)
>>>>> fails with:
>>>>>
>>>>>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf fffff=
fff, msr ffffffff (22 =3D Invalid argument): Internal error
>>>>>   xc: error: Restore failed (22 =3D Invalid argument): Internal error
>>>>>
>>>>> which is a safety check to prevent resuming the guest when the CPUID =
data has
>>>>> been truncated.  The problem is caused by shrinking of the max polici=
es, which
>>>>> is an ABI that needs handling compatibly between different versions o=
f Xen.
>>>>
>>>> Would you mind pointing me to the flight which has hit this problem? I
>>>> don't think I've seen any respective failure. I also don't think I've
>>>> seen any respective discussion on irc, so I really wonder where all
>>>> this is coming from all of the sudden. It's not like the change in
>>>> question would have gone in just yesterday.
>>>
>>> It's from a pair of newish boxes that Credativ and Ian where
>>> attempting to commission yesterday. Since the boxes are not yet in
>>> production Ian wasn't sure if the issue could be on the testing or
>>> hardware side, so emailed the details in private for us to provide
>>> some feedback on the issue. The error is at:
>>>
>>> http://logs.test-lab.xenproject.org/osstest/logs/166296/test-amd64-amd6=
4-migrupgrade/info.html
>>
>> I see. Quite lucky timing then.
>=20
> Indeed, it was pure luck that we got this just yesterday.
>=20
>>
>>>>> Furthermore, shrinking of the default policies also breaks things in =
some
>>>>> cases, because certain cpuid=3D settings in a VM config file which us=
ed to have
>>>>> an effect will now be silently discarded.
>>>>
>>>> I'm afraid I don't see what you're talking about here. Could you give
>>>> an example? Is this about features the flags of which live in the
>>>> higher leaves, which would have got stripped from the default policies=
?
>>>> Which would mean the stripping really should happen on the max policie=
s
>>>> only (where it may not have much of an effect).
>>>
>>> I think there are two separate issues, which I tried to clarify in my
>>> reply to this same patch.
>>>
>>> Options set using cpuid=3D with xl could now be rejected when in
>>> previous versions they were accepted just fine. That's because the
>>> shrinking to the policies can now cause find_leaf calls in
>>> xc_cpuid_xend_policy to fail, and thus the whole operation would
>>> fail.
>>
>> Okay, this could be addressed by merely dropping the calls from
>> calculate_{pv,hvm}_def_policy(). Thinking about it, I can surely
>> agree they shouldn't have been put there in the first place.
>> Which would be quite the opposite of your initial proposal, where
>> you did drop them from calculate_{pv,hvm}_max_policy(). A guest
>> migrating in with a larger max leaf value should merely have that
>> max leaf value retained, but that ought to be possible without
>> dropping the shrinking from calculate_{pv,hvm}_max_policy().
>=20
> I won't argue it's not possible to do that without dropping the shrink
> from calculate_{pv,hvm}_max_policy(), but given the point we are on
> the release we should consider the safest option, and IMO that's the
> revert of the shrinking from there in order to restore the previous
> behavior and have working migrations from 4.15 -> 4.16.
>=20
> We can discuss other likely better approaches to solve this issue
> after the release.

Sure; as said earlier on I merely would like to understand things
sufficiently well before giving my ack.

Jan

>> Even
>> leaving aside migration, I guess an explicit request for a large
>> max leaf value should be honored; those possibly many trailing
>> leaves then would simply all be blank.
>>
>>> There's another likely error that only affects callers of
>>> xc_cpuid_apply_policy that pass a featureset (so not the upstream
>>> toolstack), where some leaves of the featureset could now be ignored
>>> by the guest if the max leaves value doesn't cover them anymore. Note
>>> this was already an issue even before 540d911c2813, as applying the
>>> featureset doesn't check that the set feature leaves are below the max
>>> leaf.
>>
>> If this was an issue before the commit to be reverted, I take it
>> the revert isn't going to help it?
>=20
> I think the commit makes it more likely to hit the above scenario by
> shrinking max leaves.
>=20
>> In which case this information
>> is interesting, but not applicable as justification for the
>> revert?
>=20
> As said above, while the commit at hand is not introducing the issue
> with the featuresets, it makes it more likely by shrinking the max
> leaves, and IMO it's a regression from behavior in 4.15.
>=20
> Ie: options set on the featureset on 4.15 would be exposed, while the
> same options could be hidden in 4.16 because of the shrinking to the
> default domain policies, if the user happens to set an option that's
> on an empty trailing featureset with a tail of zeroed leaves.
>=20
> Thanks, Roger.
>=20


