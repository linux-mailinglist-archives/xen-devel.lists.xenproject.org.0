Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278E24779B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248124.427957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtz5-0000yl-Ep; Thu, 16 Dec 2021 16:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248124.427957; Thu, 16 Dec 2021 16:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtz5-0000wy-BN; Thu, 16 Dec 2021 16:51:59 +0000
Received: by outflank-mailman (input) for mailman id 248124;
 Thu, 16 Dec 2021 16:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtz4-0000ws-3t
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:51:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7abbaa36-5e90-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 17:51:57 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-7AQEfiK9OHiglFBUQAi8fg-1; Thu, 16 Dec 2021 17:51:55 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (20.178.117.140) by
 AM0PR04MB5425.eurprd04.prod.outlook.com (20.178.113.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 16:51:54 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:51:54 +0000
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
X-Inumbo-ID: 7abbaa36-5e90-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639673516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vuaUmAsGB003oqz4ptURcvIftIaj6wHZf1eZY5oO/aU=;
	b=fCThSMgEfEZn3HMHOpV3qf56BHmbQIIm14yBiYK0uOQrtJjbxybjfS9W5Q1DlwgHFniVro
	0RfFEnwoNZg4SKWq0pnMSD8KfbZdrpLoDkLlQuNWUkW0hSLX227ByR3ZunczHYCW/72BiB
	JcjPuHW3H4FagWTfEvW/PpUwzXa4KEM=
X-MC-Unique: 7AQEfiK9OHiglFBUQAi8fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0ndosO4lWNpgfcJFQWnkwg8DaTAwbO5U3avPgo6ceAUZwqYaJJ5gDnCjrDiRH6Sa8p1BN1M3qaVs3FrKUaTW9LDdghiw7eake4kvKMIlZAY0HJi94Hn3lzr4awWJPEXVqM3000XAS5oG8+KGL4938y35feoyNRVP8zdTSQeAHp3qafzMvCYb5Nhnx/kfueGfSPebk/CGGxU8P3Ur2mKngjp2ivomXZ2K7eMRPv/cPQzVeo+H0EhjPtyu9awpHrAX4ND1XBqYJBb9+YNmSh+raT2BdQVUMTC9UfhVt83x2OAlLWPw9Qpo0u5gW2arGyAjAywYEmtadzsGtO8LFDqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Q9OXD/V6ENbTcfIZntNoC/5RQhsoM1AKICGpX+iqrM=;
 b=lCAhNU2SJWz6wd87kk2bcB1K33V6mX5VfB2IMKCHECkv4NwmTjI8rhNQPIAQdLNU+NP3MxzuzHNz9l/L9g3PIZrJ3/zRTHK4NO6jq2vAJJy5PNczxUsm2smt+IUjC15TXhaOJcBlS1Qqw41galh5v6DkQUoddF1cvZKPBob1D+6rUf5T8LoMrzk1LMUd1vTWtCUk/L67PFh+GAMUyE4qbDavRAg8sBqpdGQLpD2J8KlQlglLR7sxSrYQvjsAa07Ig6c0L2eGXQ0crR/ttITjN4HJ13sLAGN55GxR+7HJKVIV8Y+z9l/m/U3mtGLgQkqqFtFosbqbTsKdbqGjuJ0c9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df85e82a-1b9c-7d1b-1574-ae3ebd11a101@suse.com>
Date: Thu, 16 Dec 2021 17:51:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/4] x86/cpuid: Split dom0 handling out of
 init_domain_cpuid_policy()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-2-andrew.cooper3@citrix.com>
 <b95bc243-c4ca-824f-1812-1f0a74e22193@suse.com>
 <8e648c7b-33a6-642c-e4ff-78f17a35dbe3@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e648c7b-33a6-642c-e4ff-78f17a35dbe3@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::33) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ea09e4f-9f0c-43d0-e552-08d9c0b45d32
X-MS-TrafficTypeDiagnostic: AM0PR04MB5425:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5425A08DF0FD8574C34A3242B3779@AM0PR04MB5425.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dI2C8pmNGfd0ztfv0R5OsYXNprIK3wxExJ+ZuoceE6HOAQUpPPgNuMbQW9bS7wyI8NiYbHfauKP6wsDJCOUhuXENsX36Iv6YU3GwL3tq+2W0yzd/dHrxX+eg5Z/mA4lsF3xxfAB+bbFD/FcB/G2zllYsIRVwSzlvDzz+e32c9ECAv+r3WQDtVw1ry7TfU2PRv0UighD2K1WTJj/FTs2TG803ReAZSnSZgW/XQmS5EytWdpAC6azqWqXglKJFQmEi2NeibAwcpYyOQS37jk+qff9kHnFgdv5rmfl5YZ2tE1E1knkLOQbpfPGJ1ZpUuH3LLaKlp2sEGFoSH6pPbBz5P5nsZIB6ClrUF+rPDqTcIo+Wafhj4+jzTHV6HUKtzK2958vNkC0rfWOmbqJlVBhyt1mauk85ryfMQ4NdIpHAF75m4PmgmNvojDS+tFFUumFevlqVgHgMxxazRSL/Mj8cDX2kVmXyWuugui2AbfqMc4AQjlqNG+ttnyTYYNRIeJtOip7ACagowkyHtCUkmacj+/5W8Sgj1ZBg/odJKccdrXuixrQXU0WW5x9nBTFqeMLPQ6q3zEC3x9kflS14fQMfVUXMOUdULfrJxlFsBD8N/2ZXgs272VdDvKVFl4K4K9CIw8FJsUORrlK5vvRyKgkz789NfnInVaWzGD61ZGs8qNEoRz6Cg2Bg/A5rkFfY6r0eSANcPmdDbGtdnlyYj2gT5tbqANVHPjT21bYQJ3Cdb3HK/ndJsWYN4mdyExxF8JsB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(186003)(38100700002)(66556008)(316002)(31696002)(6512007)(31686004)(86362001)(26005)(2906002)(36756003)(5660300002)(4326008)(6506007)(8936002)(110136005)(54906003)(6486002)(8676002)(66946007)(2616005)(53546011)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R8LSTXnx8rbj8lfq4qoaUXveip+JYcbFkSbXxoez9calcpC43vyz6PbrJIu0?=
 =?us-ascii?Q?NPz89ayS4BiSFrCqt+O5+nL5WPGds3r6754XEGhjS4p14YCT1k3K/9wxWkXx?=
 =?us-ascii?Q?KpX7Mec8sAmXspWGghGzh7K8kXf2aQgaV1aA/NXTPWEKNOurSfOy6/bla5a2?=
 =?us-ascii?Q?0spxsFwkYXlwET5rL9l2r7Q3FLjwfasqiJEPjPzRcVXCJWu3dsybxSmNI+ss?=
 =?us-ascii?Q?c4I8oD+OjxsG97UDpVUVRKzA4DPXAobDEg1jVj30UgNZixc7QEJuM7sKd8oA?=
 =?us-ascii?Q?76L0QX9lH76kNtdTMQQkGJij0Wr1dQyi90UrKWgFjBK5ceD8O+2kjVOSm8RU?=
 =?us-ascii?Q?lQz4G4Cvy5spMKgZU5mY/3tzN+utHitJ/KZ0XTB2RsQcXaUrtEnNWlMkdyiP?=
 =?us-ascii?Q?7d1Q0jBGUSX9Mc3AutEpAB+iYcV302VFZiz+GmFF+2M2tAOXvrtKVAdH2pSR?=
 =?us-ascii?Q?GIU2K6Q67k0brftHe9cajl94oh1OmMHxK5YOyNDc28ZIEOEwkYfXIAYdRZQ+?=
 =?us-ascii?Q?TvFBb3CJ7D3aca7VWm3yr9W8YPKZHmOXuuwPzuCJ7JTpEg4tpCvorYJOrjJb?=
 =?us-ascii?Q?lybHdzzPB/htHc7eNnnxP5pS44qkAjSQQeT9rVGXpdwba+MMSEsdI8weBwlX?=
 =?us-ascii?Q?9jNOsXZQu/M/PKMRRbT6LWLZqKgVqPdedRWB1x8640crpqadt2ZfK8psUVwo?=
 =?us-ascii?Q?jIV7JPjrRQSz5fCM60+8VHzivsf60BNGBrkflrQNZlvWFixl2o+JpomdyR66?=
 =?us-ascii?Q?HUPBHIYOoPXSL6O0mDwDDyZQUfRXff88eI9O7iiOhlo5cIVv2vuNg0SQfc+V?=
 =?us-ascii?Q?PQyMdz3McojOXDODxMlakHmzWvePzR24+ZIxVSP4ZvQ37AaJhuUeTikbf34q?=
 =?us-ascii?Q?gnHEDfAak5cCaqClivtdlK+VFf1AUsstswqLo7n8d+yLQcdby6ao4TmUwgvU?=
 =?us-ascii?Q?t8AVwpmEkUzn27etb2s2Kclhoz8G0mP2BjoWQKjz6cLmyIvwwzjD9zeGkO9C?=
 =?us-ascii?Q?L7JL9SYGj1sxdbnLzOPRI6oFKwtyQyP8I0xHRMwU8jnJq3PU/jaMIcmPL920?=
 =?us-ascii?Q?aBtyZCyAZ6itk09bbq20pTEGr6GO4+AH9sLenKVA939hU9p0WEvZ42ibiNG9?=
 =?us-ascii?Q?gEu4mWuQz6WhHYBUnbduKsOoTt+PhZfKRI3fvc8sD2VAZHRo0OssU25dp6oB?=
 =?us-ascii?Q?fsFa2RRzRAfXeFUSzXPupheIr7DHm9jVnnUo2SCF9elbR2wNXL3S0aMoD5oF?=
 =?us-ascii?Q?xnAORZTLXyYLhSUtOvRQmH68dB1apG6HrE89fFqRVYRkIJi73GY95E6Q7uxm?=
 =?us-ascii?Q?MAjsBEYVwt/8dhlRHXr6lBQp/wRhlQ8/QwMKabc1d7SqHZAgrOzxUyqIKJGW?=
 =?us-ascii?Q?sEk7wqQrJVgxDXMT17vsvL8ndcdWHn5ok8LWs6+252XbsE/wjvyTCOwrgX7G?=
 =?us-ascii?Q?LjvmZyJkY4WzvUeLP2WPvWr+gPFHlLWLVPfIpqO7OEj7xliDpWrfA2GoSwyI?=
 =?us-ascii?Q?wof19eVyn8YorFrnpamZHvWtEcoDTndmgR+0tYa+uUriTt4dDktR0a769iHe?=
 =?us-ascii?Q?A5/HcJ86eBU4jmkBMwEUZlp4imYQSDVJroaDy0+UY7GCmYDQvzbl8eF7rgJF?=
 =?us-ascii?Q?CRZKdpDEYp4ujXX3+iLJVWI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea09e4f-9f0c-43d0-e552-08d9c0b45d32
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:51:54.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXklzGJQhR8gjAXMLGMKTXgriAQoR/ggzXFDmlamJY8AB0U409vvcAxGLhJq3lzmeP2I+lNxgVJ01URvq7VqvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5425

On 16.12.2021 17:41, Andrew Cooper wrote:
> On 16/12/2021 16:38, Jan Beulich wrote:
>> On 15.12.2021 23:21, Andrew Cooper wrote:
>>> To implement dom0-cpuid=3D support, the special cases would need extend=
ing.
>>> However there is already a problem with late hwdom where the special ca=
ses
>>> override toolstack settings, which is unintended and poor behaviour.
>>>
>>> Introduce a new init_dom0_cpuid_policy() for the purpose, moving the IT=
SC and
>>> ARCH_CAPS logic.  The is_hardware_domain() can be dropped, and for now =
there
>>> is no need to rerun recalculate_cpuid_policy(); this is a relatively ex=
pensive
>>> operation, and will become more-so over time.
>> Would you mind leaving it there in a commented out form, hinting at when
>> it may need re-enabling?
>=20
> Leave what?=C2=A0 The recalculate_cpuid_policy()?=C2=A0 That comes back i=
n later
> in the series.

I've meanwhile spotted it, yes. Let's hope its conditional invocation
there makes clear enough that with certain other changes it may also
be needed.

Jan


