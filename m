Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640BB3A92CC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 08:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142698.263230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPCT-0006hR-7q; Wed, 16 Jun 2021 06:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142698.263230; Wed, 16 Jun 2021 06:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPCT-0006ex-36; Wed, 16 Jun 2021 06:38:57 +0000
Received: by outflank-mailman (input) for mailman id 142698;
 Wed, 16 Jun 2021 06:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltPCR-0006er-FE
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 06:38:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d4cd851-01ed-49b5-8c0f-e188d152c837;
 Wed, 16 Jun 2021 06:38:54 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-jwuixr1vP9uY2q6s3zHBOw-1;
 Wed, 16 Jun 2021 08:38:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 06:38:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 06:38:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 06:38:50 +0000
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
X-Inumbo-ID: 7d4cd851-01ed-49b5-8c0f-e188d152c837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623825533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7o62CH8tMP29dDg5bCfHgvNzv32UOojgxqPbsnjUHHE=;
	b=YBeS0+X/0b7AqcKqHjHhBxhTQMrVW8Mpm59WQ2ofzUBoqub+Jr/ieIEMeek033vWczM9f4
	iYPS6uL1xgB5pmRslkk+o2eoKOhuvzD+nkaByGbM1HoJ58RzXPBTfBAQ7Jaq/Cw1lK6icH
	mODiNsFSlwTxKReKk9LAA3nXPZ7YRgI=
X-MC-Unique: jwuixr1vP9uY2q6s3zHBOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfSixjsENXfEWhVAwvR2ap5Y06f5snoYqPIsr9QmOHhb9p+1oE/w0jxBXPk2pJBDnslnHHPxlOpXlT+VYyE0OxOA7Q5DS2EIj3IyTKOaQvp/qT/8yWDqQUrUfB/xKjgtn1JgwYMmBQwtaiD345UGzFhcdyz/eUI0GbqDZUy/4jTNpPrVq0mkHrujY+NvMdjHMTZb9sg5M1m1C+z1i4SHKepuVmOZK1bt9n6bsnwSe7X9rTS6QrcTvorNhP9U06piUQbBu2h3sb81I4zQeShSGxI9xxrlg+0SVS0SCNEQRU2LH2lNO6PLgfrI5Gx3qlfMqy2/QLyxmuizNzRmYR2Vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o62CH8tMP29dDg5bCfHgvNzv32UOojgxqPbsnjUHHE=;
 b=HLDHR5eQUV8QlhnOYDR1J+v/L4NfKR35FpyYhzu8ba0Wgt496iTroNZhS8rprWzEx0xbEIqN+DgQIQuZIgW+CN6dhAm41BT2NkfSLzkt2zLHsq9ea9FEUZkxFNHnhcUVe2/nDfww8GqlOVsDlysI1giaHGM4OdEk+8bvdA/oB9Ztyu6kpWJTy/6tsUL9Qxt8cYGpAZnQxqY1Fb3Evw3I/qHBht1vOo+02/ac085vVc8KsOa2a5ywTG37jHGSokCZjYAJdzFPcBEhnHGDRZNJlvDT18K7mQdXDtzwn9qlPwTu6BqV3w5Qk6VTr5HSdBjIdT/7jy2eHcD9hb/9phhj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/5] tools/tests: More cleanup for automation improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b0de61c-0276-cf06-4eeb-cda9ca990940@suse.com>
Date: Wed, 16 Jun 2021 08:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615161905.9831-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df56e2b0-d882-4c84-51d3-08d9309166ef
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7149AC3E199A5F0C9F6FD8CEB30F9@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R4J0mjy/iixNGhIfwRNaSUx4jpSImLGje35l0gaBFDJG8/wm06SUhENi0qtXQo34OUk6+m0kWQcbz3vxFnlMrMjMlH1RXkjEclThPSV86HodCznxHINgbPIo4Y7GFUqlbgQFXpz1Wjy8jVzL5Y1i1DUeBM7csAJ0tQz1FXwoTGoE0j7jnpQXpXscp1Czzi/7fUDRORqZSoj+J/M2LO0G+seU3aJ3sSZ57gY9mJyZ6+zUJnTRhvFykmHfejbazEUC8gM0HZmIhpGzzYtsP8I0YQ4L+uUZ8LxpzJEILrxw3hJbfRZ60W1WD70AOwlNpn14qjMGs+ZSY46SEykoO88kPmj8VfrTEGL84KJwqhHigvc7aURXS60D4m0hcoTyDENgOc3K3ZNUTkK7m0mOvwo3+5VueRMqApVXBB6qfknQr46N1OKuyzbdEXcbTQrf2raICxktNgBlR8whj0DboKs8Kr3cC3PdJXDksUQw24qHrpyEeB771HRANtC23OUmL3iVlLAd77yr3Kgs0Hm7lHMMKYsTmQSIdPLGGFKPXMy26SzEl/m+SRZdXd1c3Qnj23Zp3vHMNppsm7jHrCPyHDRXfk7AZrc5lxrGXEfX5O8WrmSS4XOLDx+E1HV6mtCcsj1WDoMRSS3jnIsD1IwmyjspG2XS8Z/VJn5lSTONltGbj4Z55dOrGZqJWQDPa4nYn1q3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(39860400002)(366004)(346002)(478600001)(38100700002)(31696002)(8936002)(4326008)(36756003)(16526019)(186003)(66556008)(2906002)(66946007)(8676002)(6486002)(26005)(66476007)(16576012)(83380400001)(2616005)(316002)(956004)(86362001)(5660300002)(31686004)(6916009)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmlSbEFJbVNBR0NEelRPamRUMnY3U1JGNFY0OXBzUEtMSkNhSU1oMFV2WUp6?=
 =?utf-8?B?S2Q1NHFJY3pUN3RFZFJueXF5RlQ3U09Dc2xQN0ZJMFhuZkhOS3JBNmZraFV5?=
 =?utf-8?B?T0gyTk5pRi9mSlpJSElWcjJJak9EYlFwaHFQQWJKNUpFbS9Dd0dqNDIzbEgw?=
 =?utf-8?B?MHlHY0pJYkE5bWRzb2k5NFpMQ3RSaW9zOVpreUw4MGh1dzBFZ0UvR1h3WVd6?=
 =?utf-8?B?V1Z5S1VpRGgyZHNGaU5wMlh5WExOSnNaK0pxNHcvMFk4d2RVaGZXK0VlZFhk?=
 =?utf-8?B?aDdXNG9jRzdiWkw3aHJBdUd0YmljMFk2a1BZSUU4U055TGFOUzJnQi9GMmpD?=
 =?utf-8?B?SFlaS1pwdWwyWUFhNkNwSUdiMW1RWTVZclYxWkVDeitueEZpK09JWEEvaFdB?=
 =?utf-8?B?M1VWdzQ0Q0VKNkl0eTc5RnZ0SlJ3OC8rR1BFOGptRlJzNFNOaXBxWWs0RFh3?=
 =?utf-8?B?RDZlT3pDYnVyVFJxSzFzb0ZuVmVHUDMyck5iZ2pxTlRRSUJKQjIzS211bG0v?=
 =?utf-8?B?aDhIMnlXYmFaVXZoWU5EQzRDWlRNbG45QVQzNW9xTkRYNXl0bW1mazVxSkk2?=
 =?utf-8?B?Zy9ac3RsUVlKUUZqbGp1ZnV0YzFRQzJFcGZFbFovTEY3R0dBcEFhNHpBQURR?=
 =?utf-8?B?andSNlVQMWdreUowYi9EZlFjK0ZDdlpqVmJscldYMHpqODZQMzFRZUlraWUr?=
 =?utf-8?B?L0FNOEFRY2U0eTN1eEUxQ2dqMnNSQTNrN2dSVXA1QWlIMkcwbWhjVGRiaGpt?=
 =?utf-8?B?aXNMck8rZnR5dnd5bnk1VElyVmFjdlQyUFI2Y29Qbzh1d3lqWlV6bWRFYis4?=
 =?utf-8?B?MlZRVk9CK2d6NndsNVRUeWFWaDVCSDA1STB3QllZN3JXQVRiWkl5WDFmbXRZ?=
 =?utf-8?B?d1E2eW5id0EyckI5TXV2TDJHUUNkR1M5N2ZackdrUWl3QU1vQlVlaEhsR1Bh?=
 =?utf-8?B?UU9rZG1ZYVhaYkNKNzJzRzMvdXc0Qmt3S3hkcFp1b3BWN1BWcndlZEVmRzhB?=
 =?utf-8?B?NjVteVlrdVRBUVhERkdqRW1SZ1pJRmU0em1YK1FpVG5UTjFaVmRhNzRsWGdn?=
 =?utf-8?B?eXF6R0N1UTB0d2g1RzFhRy9hMkVPQUY4TmplWmxuc1NnVFhGNHAvM2pRN254?=
 =?utf-8?B?SExYN05tS0U5SDAzQ0N4eUxWdGtCd2Z5M1hsRDdCMk1JUXlqZTF2L1FEeU8v?=
 =?utf-8?B?ZmVkOWExRWNqeUkxZkxpRk1NaGl1eTdkcWZUTjd4ZU94c1FJSE5ZRHZ5bzJE?=
 =?utf-8?B?elBIR0xaZWEwUm5ORytPWG1ZNlhlYXNOcnNBeUZGcjFlajczN0k0UzFpbyts?=
 =?utf-8?B?L1VHZzg4QklKTFg1OStMU0l3cm10UUR5QnZCODYwSkZtK044UGRGYlV2YXMw?=
 =?utf-8?B?V3E4bC9sVkJxNFcyRVVIODlrZk9LWld2Vkk0d2RlWkNNM1ZIdjgwbjNZcHJX?=
 =?utf-8?B?Sm5VRnBOR2FmcmZuaTN3SnUzMVovMytNQU52ZHNzSnNieWxINmpaMHNrK3Vi?=
 =?utf-8?B?SGNlbENScnVTN2dLMW1ZQmwzTUpmakpoSUswZlJhdmNaYUd5RnNXZnRkNEFK?=
 =?utf-8?B?dDJkRUk1cDRucDU2WVNYb0lxY0o1Yktja2lJbUNyMmpzMjN1S2YxWGxyM1h4?=
 =?utf-8?B?VFRiaEM2Snp3b3Bhb2o4RkdwcnphNXVqbVM0em1nZm9TK2RNZFJYMUhEM1Ja?=
 =?utf-8?B?SW9mNFB4akxxNWt2L2w5U2hBa3VMdVU4ejViWEJzMFowVFdLZWdLaUdtM2FD?=
 =?utf-8?Q?nPOnbJgeMi7J9eQIv0GEF7l3FtrFxrCy9hLYyRW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df56e2b0-d882-4c84-51d3-08d9309166ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 06:38:50.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbDsX3afsl/wnnpLN2FTu1kapauJ2lud8NIBrBC8s+Uah8wCA8TNUue+0A/gCwzrEatRgea/83Wm5+8gPAUIUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 15.06.2021 18:19, Andrew Cooper wrote:
> Jan/Roger: x86_emulator and vpci use $(HOSTCC) not $(CC).  While they are unit
> tests, we still potentially want to run them in dom0 rather than the build
> environment - particularly for x86_emulator which is heavily CPUID based and
> wants to run on a wide set of hardware.  Any issues moving them off $(HOSTCC)?

Well, yes, I'm afraid: If anything, we may need to build two binaries,
or build the one binary two different ways: The "run" (and "run32" for
the emulator harness) target wants a binary built with HOSTCC. The
install target (which prior to your series does nothing) indeed wants
building with CC. So maybe we want something like

install: HOSTCC:=$(CC)

plus suitable detection of whether the opposite set of objects are
presently in the build area, requiring a full rebuild? (Of course this
will work only as long as HOSTCC isn't used for any build time helper
binaries. See "x86emul: test AMX insns" for when this starts not to be
the case anymore for the emulator harness. So we'd need yet another
variable to express this detail.)

Jan


