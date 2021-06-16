Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C13A9E11
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143318.264225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWrP-0002pd-3I; Wed, 16 Jun 2021 14:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143318.264225; Wed, 16 Jun 2021 14:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWrO-0002mP-WC; Wed, 16 Jun 2021 14:49:43 +0000
Received: by outflank-mailman (input) for mailman id 143318;
 Wed, 16 Jun 2021 14:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltWrM-0002mJ-RT
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:49:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1676ad9e-93b6-4a0e-9a7e-f6bb1a7b7629;
 Wed, 16 Jun 2021 14:49:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-P7_ZRSQoP1iF_uKzFfNjuw-1; Wed, 16 Jun 2021 16:49:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 16 Jun
 2021 14:49:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 14:49:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 14:49:34 +0000
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
X-Inumbo-ID: 1676ad9e-93b6-4a0e-9a7e-f6bb1a7b7629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623854978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfx/z6Gn12LvWIDZev2ilo1Hf/f2BsBOP0o0auTiRL4=;
	b=RD+WzFQT7paSt5vf2hSdvIygCSkktqYnPxDRDtzAD8t3SlhNCGw91QFo6pHUnEER9jXGy+
	oUYdRFvAiZEK7jTw6BoPmzDRcSAITYFG/kbWGwnCIkE0SR1YqloWe47L7V81/RziB+dy+N
	jjMtKB7UqFBf+vd/RMNzB8pU9BN4LeM=
X-MC-Unique: P7_ZRSQoP1iF_uKzFfNjuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqamaEt08eVjfPYyaOBvzObLzDzAeA8luWSZyvLE1Kmd+qpw6oTySRl+D4uRb6Xgg/2eXQq12+gqtva0RZWttxvhcw1HSb+idzJdlQ4BdUL4ecglt9L1Zr7Z7VOfh13tqiZbk0ud1KByRMt3IyDzDLZr3BlSh8q8q6nNIm0xPB5Si4FFHdcLRwLehiD0qWoTSgzGs4qj6oJUryeqT51EpbA4QKkz337CcK8nyZUizJFByO5DAHRs6eDdLk4khYAgJPc/FkktbwO36bodlQO4QyQPrfTflxGv/7KuNZ/VzRruw+tHFRr7kP7jBUSIdIXXxUN9oSfSFTGjkGW5f2MbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/ZMKelHV+Jv01gZUSj82wX7lF9u4L04oMHCqlNtAi4=;
 b=Mi/YS7hS7BxdkluUC45vV4EGp8p3T750FGmklEA84xpq141RR+/EBDsLFGbCUs8+kr9+s4OLid/6+msXNSl490kGY2/vFls4YQ09YyTlxLnmT4cgzEoz1UDRVDR1EaJZNBMFddDCYsZV+esK48eypOZF3rkg5Dz34rmXDXkkgQVEth9sQMkpQNU1zV1pP9dbGdmlDcOzX51veq5ZM/MQIX4S7gqufw4U4ETomZaj58YeurMGfolEIIvGjBclG015kEThXT63bKVvRAO7HWmY/c/mi3KVGry3mACfKIM+aY4e81SwqUde3g37j4Eb9VAUPJ6BCbB7PuLRxxMCiV9kJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-162845-mainreport@xen.org>
 <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com> <YMoI8YZfOvogwOMY@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8c4151a-6dac-d87c-ef46-eb35ada07bd9@suse.com>
Date: Wed, 16 Jun 2021 16:49:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YMoI8YZfOvogwOMY@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69769ea5-c012-4614-e9e7-08d930d5f54d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335E488A3569C3E5E55AAB7B30F9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7IZbK6Z/ZW/Yj3keUW63Cg1guZS/4AZx9OPU+CvFweOqS5KubmALLCiJOorwqv/U0vAhwKUV/osLL0FU51HahTp+GWYlbbq49VRBR/VZtwMOdfkMfq7YNsdlGTflOxzVyVLYRirbGBGpnrtz40GuLoFsecOvSocDHgUJPPqxHUf+lISDTipr5E1MJmlbWGGqkoAs1hp1AaVEK3i/xGPH68uNYut97b5LVpjwzoO36+d3raTet2eotxpMRCs4ozuyuuPzJELoUYPxyjjyMXsgUKxUmE8FVBYRBDGH+QsNoeWB1afos1j/8ansi/3McL9hPfOlfRnzegSNUGUO1T/JYIfEZgpkd50zUhby6FijykTb8XWQAStIJO5Thvi7TSxKdxKf5WgyfPA2pJ8I/PWJydeuhZT2nZkZt1RJdLvEhcsNyNFb+sj4xvUNO2h7JiCLlTo859F1QN4c03yOjI25RaWK8u9L7T6gX7UZGAvG30UeEeH3hfr9wqDb02sC8D6Hn+dYIv1bQzY7PqWQihH5XT/1ccl1clZ821ZK6L4XqFJfZVLMdGHtE98PFkNkuclIE7yb5ecK/z8oMd8l6OtQfL8Lc9BGeWkkM/Xvb3ikeQgj+go7ooD/vi393UMGCXPGJ8mwpwJ0XJ3qx+gyYj6ijCSvQvSzQSriv8FxG161cCWROk8ZkQaIsfY2lldbPAgnK8sTPKJrhpzU5la8+DNcsCojUNYcfsUczauePZIvWRvPp/wScjGaLKAx07sM5kGenmbunGwrmJEP1dwF3HygLHJzPje6vK/1fgE4E5jK7nNT1kU9zWkZ7MSVHwI99MOKVZhHwm5Jv9d/KcFkFF+k2XfRKeTXdXnbXWYuLicp/ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(136003)(39860400002)(376002)(31686004)(478600001)(53546011)(5660300002)(6916009)(66574015)(38100700002)(2616005)(83380400001)(956004)(36756003)(6486002)(316002)(8676002)(8936002)(54906003)(966005)(4326008)(31696002)(16576012)(16526019)(86362001)(186003)(66556008)(2906002)(26005)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?il4lWVSgIxx0XFYlw9LzX8EF4OZyQzYxxC1zok+AcRPWR2gvK60Z8MDvK/JI?=
 =?us-ascii?Q?CD8TuP5x+KcRBEcNlIp6gjiyhe8vTGzOAgk9Y96Yl+9ArGRGbsJzp5MoS1ES?=
 =?us-ascii?Q?UPLeTd58N0n1tIeBKL7JmR/ewclERJWbKlV8bygFm/rwjK7p+BBZ+Z0wiBnO?=
 =?us-ascii?Q?OsZ1SMMZ/Z2K2szwBBYJwYNrj/XzL7ZybmPiyzu5sPB00Qppa1qJRn2vK2B9?=
 =?us-ascii?Q?+rQ/0JOv168vOfk+XRGRCi4XupHjj+oV9g9Yct03u20vWAnQxI1vNW/2Szbt?=
 =?us-ascii?Q?FYckhfXQOcGCSwFzc+tHZdlchysNxW5OFy1RHjWcLYry6cyuihQpgUH7Fe3K?=
 =?us-ascii?Q?jTx+HI2OXlszFHSBbcSJtQ1K7XX/uL5iuqIg4xui8Xw1phJgR4ZOM0BNiPSV?=
 =?us-ascii?Q?pN2xAOZiFgUsYVGWrpoVAtnzwPJ8aFKg6cT8yBGQlXw+Ra34RroRTQB2dFz0?=
 =?us-ascii?Q?9Rz8jyUcBBvBF0oM5MNL6H14RfKgc7wsPFRVxEfAGNze6XHi1DxfCkfwTB5l?=
 =?us-ascii?Q?R0b7iGMI0eGX98VS4Z3amzvvHUyPkhN4i3YS+Vz8LzC80rRs846+QnyZQX0z?=
 =?us-ascii?Q?+lmYtHr/Pww7UlBtDUHCP36YP55KzGrVjnniUXsMXqQE85DpnfLlMgGDYK14?=
 =?us-ascii?Q?ZewtHjN8PvZiYysjFn+Wi40mDoBm2zTmcmiKkAVFkOZgLfEaQSjFA0ttNdC4?=
 =?us-ascii?Q?32oEKrkvg7ZOuiIHf4SoXsYI9StWV06r+wjqgA2MufH/MaFASr2sGU7RDjWm?=
 =?us-ascii?Q?cqNHHhIWYv1Yczhuy0QUBFtgUoHEIcR7p2TxbJ/4BV/cIYyEQzKYObi3SAuZ?=
 =?us-ascii?Q?Cjg5GhqVbUQzk8nNLgT15cPKisWlT6lEufjmII0y1LTqmYPX0USLm5wJiioi?=
 =?us-ascii?Q?tEKR53352DzCJcxo/LutWMJQbLoSuNNPPNNsK8Tq5+JHoo4CDDizQKwI6qrK?=
 =?us-ascii?Q?z08skfbI/NAmBJgtdRLh5dH58qiVL9VknNDNlT1gWzS1ZRWNLOL57wKwLIWp?=
 =?us-ascii?Q?hMN2OdDLbNdLRMhsze4Rgo66Lsb3SeDqrPDWPXExRXHmN5TTEmjIvUVXN82j?=
 =?us-ascii?Q?TPz1VZCDFS5toJs7xolMY4VvPUXRbbRIGn0pGHQyO4FUjudoAvgyXpwbRd/j?=
 =?us-ascii?Q?DoSCl5D55GQuz84pp1jPITimDC8ca8g7YifVYz7PTDtBXEoElyfHkFo3Pz6W?=
 =?us-ascii?Q?tAX1Deo7DHIUelk2KgdcfmBY1qvqbp5BIape7K253r8IvSGGODCJt04UvgC5?=
 =?us-ascii?Q?MEJAHmA4rOtecmJ/bq77bm8w2/qCXKh67Q1sT0dR4/xd8VgeL4uoqSugCkf3?=
 =?us-ascii?Q?DgYx4+ymMHI2B+Ne0LqebQ+H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69769ea5-c012-4614-e9e7-08d930d5f54d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 14:49:35.2796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpjOZM8XB1mRdcAVcc4XovBZpycomitOl2NIbYbOm4QzuK4nOySPy9kKPRhVTpxQyGUOyKkZbw7PoxyerAHc3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 16.06.2021 16:21, Anthony PERARD wrote:
> On Wed, Jun 16, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
>> On 16.06.2021 08:54, osstest service owner wrote:
>>> flight 162845 xen-unstable real [real]
>>> flight 162853 xen-unstable real-retest [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/162845/
>>> http://logs.test-lab.xenproject.org/osstest/logs/162853/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. v=
s. 162533
>>>  test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs=
. 162533
>>
>> There looks to still be an issue with the ovmf version used. I'm
>> puzzled to find this flight reporting
>>
>> built_revision_ovmf	e1999b264f1f9d7230edf2448f757c73da567832
>>
>> which isn't what the tree recently was rewound to, but about two
>> dozen commits older. I hope one of you has a clue at what is going
>> on here.
>=20
> So this commit is "master" from https://xenbits.xen.org/git-http/ovmf.git
> rather than "xen-tested-master" from https://xenbits.xen.org/git-http/oss=
test/ovmf.git
>=20
> master is what xen.git would have cloned. And "xen-tested-master" is the
> commit that I was expecting osstest to pick up, but maybe that as been
> setup only for stable trees?
>=20
> Anyway, after aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform
> file is exist"), it isn't the same OVMF that is been used. We used to
> use OvmfX64, but now we are going to use OvmfXen. (Xen support in
> OvmfX64 has been removed so can't be used anymore.)
>=20
>=20
> So there is maybe an issue with OvmfXen which doesn't need to block
> xen-unstable flights.
>=20
>=20
> As for the failure, I can think of one thing in that is different,
> OvmfXen maps the XENMAPSPACE_shared_info page as high as possible in the
> guest physical memory, in order to avoid creating hole the RAM, but a
> call to XENMEM_remove_from_physmap is done as well. Could that actually
> cause issues with saverestore?

I don't think it should. But I now notice I should have looked at the
logs of these tests:

xc: info: Saving domain 2, type x86 HVM
xc: error: Unable to obtain the guest p2m size (1 =3D Operation not permitt=
ed): Internal error
xc: error: Save failed (1 =3D Operation not permitted): Internal error

which looks suspiciously similar to the issue J=C3=BCrgen's d21121685fac
("tools/libs/guest: fix save and restore of pv domains after 32-bit
de-support") took care of, just that here we're dealing with a HVM
guest. I'll have to go inspect what exactly the library is doing there,
and hence where in Xen the -EPERM may be coming from all of the
sudden (and only for OVMF).

Of course the behavior you describe above may play into this, since
aiui this might lead to an excessively large p2m (depending what
exactly you mean with "as high as possible").

> So maybe we can force-push in the mean time if tests with OVMF is the
> only failure.

I don't think I see a force push justified just yet.

Jan


