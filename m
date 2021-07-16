Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089A3CB7C5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 15:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157194.290147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Nhq-0002Kp-8z; Fri, 16 Jul 2021 13:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157194.290147; Fri, 16 Jul 2021 13:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Nhq-0002HI-58; Fri, 16 Jul 2021 13:16:42 +0000
Received: by outflank-mailman (input) for mailman id 157194;
 Fri, 16 Jul 2021 13:16:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3zi8=MI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m4Nhp-0002HC-AN
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 13:16:41 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39e647d4-02dc-41c8-98e9-b89d5cc80617;
 Fri, 16 Jul 2021 13:16:40 +0000 (UTC)
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
X-Inumbo-ID: 39e647d4-02dc-41c8-98e9-b89d5cc80617
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626441400;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DR6Ai5Xa4WVXv6FHwLHusXxkyyTdFGy34DV1OnhZBgg=;
  b=GV3qa8m28tCL1xQQ3x8dkbr1SiXxNAgcvEORxeVRj3KHN/rCGmEvL48S
   pmuAaSUMmEMLya7H3sPa6pD4hcsyW3Ku/nCslLiwK73wqWmLnT+pIAZY8
   7QJhAemZyQ88HHr6fomgRNozzlO9ESEaUEqve6SsKnB/I7qHKBI8kZkid
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 08LKlQzwTvXen1RDD7+5zFQEhSsPcRbjyReoMiwr+QtBvEHZYxNlmQuFDYwmbT0+I/mP4Ckt3s
 OvFdyp1e0CyZcYTPqy70g2NjBaUSSgjKebr7nBaacqXZjX4wK6nCn4VeJltYf9dTV9TNtpsu8c
 AqLMLHU/eUP+8OKduhwWV8ENCfeNqutkxHI3HdUHefu9PgCqM773q6HPbPSE29+MNdLKLsnf8V
 zYTofPYNn8bVoL+HEw96V9j2Dah7KuYYxKoTdPt/5xLYZJOGPLo16ZgfTxCIOnbkm+lOQ2dRdy
 Eeg=
X-SBRS: 5.1
X-MesageID: 48491563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ccuc6aDSAfNgKRzlHeiBsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH7P+VAssRQb9exoV5PwJU80maQFg7X5Xo3SPzUO2lHYVb2KhLGKq1KPexEWntQtrZ
 uIGJIOb+EYY2IK6PoS1DPIaOrIjeP3gpyAtKP79TNAXAtqY6Zv40NQDRuaKFR/QE1jCYAiHJ
 SRy8Jbr374EE5nGviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3dkwKsk80
 LCjwvlj5/Txs1SnnXntlP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01iPvH0idhrP
 D85zMbe+hj4XLYeW+45TH33RP77Too43j+jXeFnHrYp9DjTj5SMbsNuWtgSGqU16MchqA17E
 sL5RPRi3NvN2K3oM0p3amCa/lo/nDE0EbK39RjwEC3arFuFYO5m7Zvgn+9IK1wZh4S17pXbN
 WGLPuslMq+ImnqHEwwgAFUsaORtzIIb2C7fnQ=
X-IronPort-AV: E=Sophos;i="5.84,245,1620705600"; 
   d="scan'208";a="48491563"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UraiKHV111KcefME0YmpKEGT+6t/Ny6CbS15AzXnuJBbwacp/XSmbeg7fW+a+ur3/U1L6efVpkuP4EyLytu0ed2xf1awmLWIe4kzppcSvWV6bYj4oBiGUXGh/Km9oraK6/1kXBnGLTSjQf8gvwcaekDSpW7TE6kdZhs0HOv1Ju55MCvhg/iZYw5uSpiODLz6TXNB3Ew7eT4y259Uf7kvK1eVyeoPywLvY3P9ZG/vlI5TNqqplRWsnEXPHfhNPbMMK4UyNw2tb3dYVgJzCasVK5fWUEAKgyCGjY3F9NWVB7X/SKVT3INN+WFSbqWVZdnkNqbb4jEM/dm5H7UnY+fpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWQ1w12/rYNjVFUUSN6VOAOsAuUw+vdXrllb8zol+XY=;
 b=RrKLJn2JWtu7oPEUwIOrj33BSLJnZnaFgjOhrWL0Jy9mUorpOWgJBgBEhek5vF04xAHWrX6gBLo0uitf4CTeTTtosTeMgPU5EBH52cjskUBbuAY4Q9EPbTtp4BwztgJ27sREkjYWw25uAxw++Llve0rht1IO77o9qWgZ0U+FfWse3wQcILwDC2f2sC4IOKbP0gEZ04ivneW0qqGteTfB+jdMUL9qTAkqyioxkB92F17Anf63ADuqbWJA1R+GRK4BOQLniTF7+Is4r0B8sT48PhYg/ILuVWRDfzdh7SIdElEn0u6WmbpxgS1bJVdSHnTnviHvUt5rZx5Jncq44H2QWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWQ1w12/rYNjVFUUSN6VOAOsAuUw+vdXrllb8zol+XY=;
 b=NFS7vqfdv39V/9XE9W2OWYrw3AiW8isgbrTYJrdAvqlNBlXdbWurk8ECuQs/YUPlCE2QwZnArkBXpWsLZRWq5q5/Y/qfyQpylGrWkt3ZF9F76Pmw7LeTmT3ruv48MMuNMAZ+upUOm0VxMK8eurkZOnRVXogp5wzxA9hFy/5gBWA=
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <17a250d3-1c1b-f079-c950-5590975e56ae@citrix.com>
Date: Fri, 16 Jul 2021 14:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <be712d94-7fac-fc34-3f61-61819c5cbc42@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a58c436-3ace-4666-024b-08d9485bcc3b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB587068353772C6BBB56AC6F7BA119@SJ0PR03MB5870.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3nx4xfflhnVxZaPguK2kwyZj85DvGtnfc9Y2ejme1e/F89fB9LKO72yGofHl+roaDaX18hsXeyWp1uVqTk4kNYIRz9gmPm/bniioHV+rZ9FjICZULzfNN6QKOTb72NS5futMMty/INCjA/b22GfqYzFj65+i6UxS1Kl/nXhfTKi3Xgt1C1VDw3pvN+elaFsP/znRLadHzkiAThiXOTKduozmlWGUVIgm2X0sifhUjzcvMnBBz8JMNJ3hC4v624Yjy+0QaDm0MV1OJaLVFRUL5Kiereib5y/uGU6d15WnHpF7kXx1MX4FFLM29hXyuPEDZsGS65NFhkdeb/dF2k2RAED/k4rCm+dlR7jE9dZvRmq9vp4lukdWR0y95PS7syFu9hIL3yjrgyenKWI6Tk1W/b/KSytH9wphHSSD/qIN0wf6XNcIV54mZyy09UPOPjNyAgcaYCnk9S8hvrp397dztKLJorQLysmtQFORRCbGuvi+CXDKQuuE9NIm5kwuqcibGjXXXSBz1T4mRaHyrffMl0yhBuo/e9oUpa5S9r3opVQXM189ImzE/q0S52EHMaMzPyyIg+C7SwHXdGO2cctU7dZunD5UmtYpzjQfBLfM70W2genVIWtbaXDqIRqlzYsdJELA1JjSqYSqwnjvwJcI6ytjsMwyeUMK5qTgvFo5x3Rd+vA1FwKO2FM/3mHsI0jEVrGpQ3aGFHatYJN1+u3gjop09huYWHr7AIm64OsNnYPgC3AMgrkll4Z+ymMQqBa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(66476007)(53546011)(6636002)(31686004)(2906002)(5660300002)(66556008)(110136005)(31696002)(66946007)(54906003)(6486002)(86362001)(36756003)(956004)(38100700002)(316002)(4326008)(16576012)(8936002)(6666004)(66574015)(2616005)(478600001)(186003)(83380400001)(8676002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHkyVG9EN1VmSVo4ck9jbU02ZytJTC9NRHhjT3Z2V1I0S2dHaFhQbWtpU1dW?=
 =?utf-8?B?bnU5cVRRVW9rOVJWenhUVWswb1gwVEtGcHBhY2kya0xWaXk4YW1sSE1iWklW?=
 =?utf-8?B?YnFVa1NlT0M2R3IvTkRNRldlMEJJUXErUWc4Z2thNjNYTzM1S0NhbEttQlZa?=
 =?utf-8?B?c3NqSGYvdEtLeWEvKzNua3NEMVIrK0QxQkpIKytaTkc5bEdIKzlCaGtneGNl?=
 =?utf-8?B?ek0xUXloL25jVXdiQzVjdTRsUERpMzI3dmlJZXdjWHlUcXdYS2xnWStpMThL?=
 =?utf-8?B?TUYyam1HckRtR0t1c2F1aUVoZjZOaDJmUlBDMGVHV042TlRJWjFidEt4TnBV?=
 =?utf-8?B?UTZhdjVEck5JQzluL00rS2pMamE0MTZoNkNTTXBHeUxsRFBOTmhrMXV3RkdX?=
 =?utf-8?B?ZS9oeTdQTy9MOUdIa2ZQVmh6QWZhaHllVzZ3RWgrc1EyZGowaUpMK1Q0SFRM?=
 =?utf-8?B?dmJvT1NEd1ZEcHBoOEd5WTAvWkw2cWRReG03NWxQZ2ttSnZla0RBM01IZzYv?=
 =?utf-8?B?VG1wUjZCN1pyL2NUWGVJOUtXTUM1NGtidkRBcWQ4Y0ZKMS96TnhSa0FvZFpC?=
 =?utf-8?B?WGZ3MElLZlhCVk92WkV2Tk9WdlVFNGpBZGl2LzlnajZrNzZJZHFPaVhCRjBv?=
 =?utf-8?B?MVJaYlB4UXg0UE5uT1RhRGRSc2FhQS9xY3BWU2QwbER4b09iZWlSd2d2KzU1?=
 =?utf-8?B?ZmY2Vy90Ni9iT0s1aXk1WVRTWU5GWmF6Z2FtME9iT1FQbVdKRWNNdm0rM3VX?=
 =?utf-8?B?UUpoaGZ2dzcrRXhkWHhpNjZVTFFwODFRa1NQQkM4MW1EM0w4cGE0SXlMYWU5?=
 =?utf-8?B?cHh4Kzd2SzMzSURSbU1vR1pWaSs5ekFPUW9KUzEvdFdoSVQ1UTZLdnJvN3FB?=
 =?utf-8?B?Z2prYzNxeFBla0o2WXhtNDFvWjdiSlNBNi9menE3MGxpSkV3VW82UmJMc2NJ?=
 =?utf-8?B?ODV6Y2ZtMjhXK2czOG93Yy9ESHU2T1JwajFINGZXblE0cnZ4TjAxRFlIbjla?=
 =?utf-8?B?Zk8rTWI5aXdjdSszQS9lOWlkQ2ZjZGxIUmwrV20vUTk0VnJYQW1ITkl3S3lQ?=
 =?utf-8?B?YjRmVXFlNlhYSG1kZUtUUVRSUVVqTFdsRFIrSTlRQlpWdzl6NTNwd1JkczNC?=
 =?utf-8?B?Q05HQUhnakM2bFhRN0ZZQmw0MUNPVW5Oelh4dXdmVWlnWFlFZ0p2Tjh5VEVC?=
 =?utf-8?B?NHZaZTFYc3dnblRZbGR6S3poV0htc1U1ajBMK1JLN1Uyd2Z3Vi8yUDRRV1g4?=
 =?utf-8?B?dm5EOGpQNHJZQjV6MkRzNG5vMnRYOGRIaVo2YmFWREcxME9xc2kxTW1GTVFW?=
 =?utf-8?B?SnFPSWVFY1ArMEtCZXM4YXVJM2VpREdWb05RNnh3U0I2UC9NUElDMHNOYjZP?=
 =?utf-8?B?RXFwaHRiOGNKbzlCZ2l3dGI1UU1TNTJLdFM3SVBDYVNYZ2hKNmZyMWVuelhv?=
 =?utf-8?B?T0RWd2NZZjBQcDBCRHZDMEtTR2ZhNndXREdPK2xjYzhFWGt6enBmOGU2SVNV?=
 =?utf-8?B?aC9qbjdxWWZEelNBdmhiNlNCSFoyS3BKbmZzSFloTWNMcHcxak9qZURrZWxE?=
 =?utf-8?B?NzduMyt1OVd2K01NTUNlK2hWTVIzWFVxclhhR291K1IySnZJZnR0c1dlMFhn?=
 =?utf-8?B?YnpkVGluYTRSc0ZwZVNEUjZEWlkzc0tUcHhFUy93TklZZ1h0dUlxdnhucWZY?=
 =?utf-8?B?ZUpzdWpPdk1MWDJnQkxkTXJQUVlDY0s3ME1kbitlNk1jcEFPQllRVExFM2hW?=
 =?utf-8?Q?02LLN86yMKRp36k1+3pL2pHCEybk+T0yDdDucpS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a58c436-3ace-4666-024b-08d9485bcc3b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:15:35.6468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKvm8whv+0wMTbwjv8AB03myvZPlowc0zBxCGdwEprk59CejIw6dV7YsKvpy7+6/gzypAUNIRNCn5sX68KJ2tLytnhyw42pMDps1DyAHOSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-OriginatorOrg: citrix.com

On 15/07/2021 07:25, Jan Beulich wrote:
> On 14.07.2021 18:17, Anthony PERARD wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -25,6 +25,9 @@ config GRANT_TABLE
>>  config HAS_ALTERNATIVE
>>  	bool
>> =20
>> +config HAS_CHECKPOLICY
>> +	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
>> +
> This is no different from other aspects of "Kconfig vs tool chain
> capabilities" sent out last August to start a discussion about
> whether we really want such. Besides J=C3=BCrgen no-one cared to reply
> iirc, which to me means no-one really cares one way or the other.

You know full well that upgrading Kconfig was specifically to be able to
use this functionality, and you know full well that I firmly support
using this mechanism, because we've had both of these arguments several
times before.

The absence of replies doesn't mean people agree with you, or even that
they don't care.=C2=A0 It either means people didn't read the email, or
didn't have time to reply, or didn't feel like wasting time rehashing
the same arguments yet again with no hope for progress.


If you really insist on refusing to features specifically intended for
the improvement of our build processes, then call a vote so we can be
done with the argument for once and for all.

~Andrew


