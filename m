Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CB5EF307
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413595.657337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqRy-0000zD-Ee; Thu, 29 Sep 2022 10:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413595.657337; Thu, 29 Sep 2022 10:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqRy-0000xQ-Bb; Thu, 29 Sep 2022 10:07:26 +0000
Received: by outflank-mailman (input) for mailman id 413595;
 Thu, 29 Sep 2022 10:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqRw-0000xG-VY
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:07:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f3e0c6a-3fde-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 12:07:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7080.eurprd04.prod.outlook.com (2603:10a6:20b:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 10:07:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:07:21 +0000
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
X-Inumbo-ID: 7f3e0c6a-3fde-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgWPxgD7KXszi3hdLbXy6NqibUB7qgpn6NbfCLY5ranUgmD4PDdxqspP10iae0IYTlmuo6kTsyY05I9GT8XwHwoOPNTsk+aPqzX+HETk14VLWtzILTbz1mnzvBz6LW8NXdoaCHUEKsEkYYxlpDFC+GgQQbL32rwsD8i95psnx1oSIOyMucyqisSRk9S1SyK3UYAxDBWFyjdXQmnsoSpp2EVAXdUxLp2XZ+n3NMW4IX9g1SIT57Nrd1apdWxrcC9RncLyXpAlsBQIccFZfwaD1orOwf1CqUIUYyMkUWaiKOYOQ0XiEG2EF6/BTsFwGlQlrKm5HwZXn1Cz2CQShpVKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVb9/T5Csgw7sBGxek7HE/E32HbXBuBKpU1/gKEShl0=;
 b=nD/iSZGDo955uRatswfnRDrKaMINS71LrdzIDwInbV+X6xe7p0yYRvUpncGIzIK+EVBy3pDiFYo0k+U7bvDgH/sXT8pb9ZktdpQ2pjBE9aLIk7Kcct33nwynjLqZs61jZl0dz1/uql3bE0zva1HS2GzSt2XdKn1lo0bS5/Sl0o59AipGAPtFMfUA1yiFoUjsjSpTu0ioufsfx1iqQ/p+JvKbNO27zem1EOvjoD4fFJQEkmastH+fyuy+/5fJNX6crnpYHP9/SRwN84BIOXjDckd85+KOsI7UPgxp3cESo+iJ58nrRRLi3eRLgYkr7MQCa5gjr0hPwlZIhTkV0gsx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVb9/T5Csgw7sBGxek7HE/E32HbXBuBKpU1/gKEShl0=;
 b=pmA+kXSOboVAIX1iao9V+v2ufHP0Ln/whHgSTIefOed81icuQGMc6R3qK70oX1iSZwz5iNFYfOIGyxbOPqN46QdUuSzdzgnxqfVPWzIREBK+FlFo/RBI7IN7YAyojwZztxH14kHVX5rPzDGfWCSES2PgHCSXrUCoXdEm5rz1KAOuWVHTiG0M+iC02yCMceJIAGkoxg4hrY6lSi+0bKWpECC6TLBt4iQJlD+sZ46bZ08ymQ52aXYl0C0k6STFeTvfTqg8tfVydOT6SjyEkHBTnTkZyz7QshfGxwTxer3yilNaAGUOBl6ywaiCW9p4LrsNrTxRzmpNKN4EpJ8M27kIUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77d1bd6f-fce6-bcd2-96f1-a672aedaa7f6@suse.com>
Date: Thu, 29 Sep 2022 12:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220927154708.15787-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220927154708.15787-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e3ca3b-3e97-4c50-afd1-08daa2026618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FXAmflrenJQJ8DSF35Caip9F4OI9c1E/0VdzC3F1VyacNSZB8iRSv1XvQ6yIbDiy28H/XyFEdKpAjqzvjeOZ0HHzJ0N0FFNXSKjwji1qjofzV30cTb73ejtC6X9VY0echOp5OBXEzq079EJ4fdl7RrBmN/sDSLOxClUDuS3wOByv5Xz7pvBQSfy/8JoICHX5PouiBUwYeOgMdZiUe5R6X2+m0flemPB4dYsrQlfBIBMuoQ3f9Qm8wjZ05LwXxg6MvHaM0VG+dc/KizpKQMsSBMT0plmh6yvrD15rSrQb4Q8D2QFA1+REhSr2J4GSyO4tS/7LZ6IyUA973qcgDFhhwU8ShaMLH4M/E6NwDgf6/PH6Gtj79fsPJ9kifRExQVzVZdB1qCF03wFD0a9CcOR93cFwdlrpJOrbfOSKflvt7aD5eZBithjsW3BhBx1FQYCF4EJ0Mt2wThV9dJVvoJ1AEj5nF1ULMyTc2AxLEeW3jU/nOLLx6nfEaoXbZpzs62ZA0zXt+pCOMII207YD99B/YK9jsdPpa91Nwgqx8wCcWfAwL7zvpoNoV3akKA3bPlzLrr1JyMFgLobOy4ZBQN4q4anCSm00L1ADNm2qWG16XCc2e9FgoYnz2xIaH8quGHVHZwk4Feg5ANiAsjmLoL3zExxD0am1BkPGM+Xs2crKFBF/pgfhWNj7S7bmZ1VgMISay+dWDS33OhSR912gzaU/Rtqcknux/Z1JSBEHWfI3cyHDRiGGoeSxn77kxdiGYe/T5ZeEdBS3mCDgwwAw/D5mFnG7qYn3I5yX5h6PkmQWIvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39850400004)(136003)(376002)(346002)(451199015)(8676002)(4326008)(66946007)(6486002)(66556008)(54906003)(83380400001)(66476007)(6916009)(316002)(86362001)(31696002)(478600001)(36756003)(6506007)(38100700002)(5660300002)(4744005)(26005)(8936002)(2906002)(186003)(2616005)(6512007)(41300700001)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OExVNUh4MXRhWjZrVEVrRW9TRWExTG9PUnU4K1hOK0pXRkdzWE4rSGFjYTVK?=
 =?utf-8?B?N3VEZUJHa2d3MksxWlQ5eUtwck9wN2lsNmJXYWdSeGZ6eWl2M1pGSmFXZGc1?=
 =?utf-8?B?Y0ZGSVQ4R3Y0djFtQWpPN0Njb1Nsc2NDSlF1b1FiSzBRYng4dGJHTTdjVUhX?=
 =?utf-8?B?Z2gxWmZVN3NMMzVGdDJIaC9Mbzh3SEtBVGpJNER3NEFKU1BOVFhlUnFFaFRl?=
 =?utf-8?B?UXRkSEdvaU9KVytlRUFSMCtqUnhtbUVDOHd2T1RNQTFvcWo5OUNaM1lQQ2di?=
 =?utf-8?B?WTBaNis4bUhuMU9MaUw4Y1dhWWNvOVd5a3JvcTZUZzJyV2ZoOUhFNENvYzMz?=
 =?utf-8?B?RmlKajlHNGxiT0dCZ0lwNzhVd0NFS096bVNKWUxNOExhOUN4bGk2elpZWnM5?=
 =?utf-8?B?MkFLS3A1UmtLMHozYm94Z1M4OGlqRXJocjg3L1BFSTFpSXN4L01YRUJLQXYz?=
 =?utf-8?B?S0hvWkZRY1c3cVd2eExmdWljeGdDamwvaDJpSm9JdzFFbTd4bEpXQzFTRWEz?=
 =?utf-8?B?czRLUFRxZkN2RGhmaFkybFN5bUNzc3FOS2JVc012VzBnYVEvVitWQjhZOEV3?=
 =?utf-8?B?V2NPeWZydkFoRTZtekZaTnJXRlN1Q3NEaUhFbE1maGwyR2o5QXpEVHdnc2tu?=
 =?utf-8?B?Lzg0K1hZdnBvdFdQRHFVckdvZytLTCtLMG9TaDl6QVFQUVhURjBCNUREUC91?=
 =?utf-8?B?ejl5amJ1Uk1Rc0RxSlRMUTM5T3ZSTVhYdDdsV0xTQ2VrK3RnU1JENnRXSVQw?=
 =?utf-8?B?OVVkUDdIMmIwd2pOYXlaSDFYancybDhkTGJEbTZFNjN0OGdJTUQ5TDNVanZs?=
 =?utf-8?B?ME5sVHNVelJ3VEI0MVYvczgxTC9LNjJOL1pZYUdobEIreXgwRGZnRVRvQW16?=
 =?utf-8?B?RHBFRUp2TzFPR2VnNkJFVTZGNDluUUpNOUdNM0lrU1JTdFlXN3ZBZFFrMGZt?=
 =?utf-8?B?K2ozSm9ueFpzR25FeUlWbkVQdC85QU1vUXVXTXUvZ2VOdkEwcTYzUm5mdnNq?=
 =?utf-8?B?OEYrK2pMRjhFSWxqQzFGYUU0ZEM1OE9Kc1pBc1FHUW5xVkV5d0dacXVOVHNJ?=
 =?utf-8?B?ZFdpa0FveU9wSk1zT0lxWi9lZVo0dEpQT29HaW1ZeWtGQWlGTXFGZHlwZ0tv?=
 =?utf-8?B?RFZ4ZjJUdUFrdm9XcVVoUWxIc2duQkVnWUFZRzJ3RGZvYkdWNzdjZ2ZiVkFQ?=
 =?utf-8?B?Qnlsa0dDMTFiNlRWMVpqb0RsNXVaVzZERFFzWWN2UmVyN0l2aGpQT2F6bjhV?=
 =?utf-8?B?ejl2VlJLRWVrck9qQXE3ZGo0SnNudk9OOW1jQTZJOGFvQkh0dW1BMnpWenlu?=
 =?utf-8?B?TklrMFp5ajZoTllXdlBIS3lzWTNaWi9jVmtwYktzbWt5RWZUUXRXdGh4UG9Y?=
 =?utf-8?B?SFdRcCtiTmRGNmtsR1VzRkpzS2N6eUIrQTdyR1lSd1Nja0pDbTlKRXFNZlRY?=
 =?utf-8?B?b1NQNVVwRU5VMGlXUWNlRHQyY0xPUTdMRytnNHc0UC9OKzI1bVgxZjg0a2ww?=
 =?utf-8?B?aDhQZkJVZit0NWMwSkF5Qm5WU3BiSWpaajIrMkczc1B3ck5BWWVEMGdBZ3g5?=
 =?utf-8?B?VFJzQ0ljR0hyMlE4RExaQzNYUmFFSmV3WXd0eVJXWktiTlVwa0ViYlZSUS92?=
 =?utf-8?B?c0dXYWpnL3BDeSttTnRwZDBxNXhxaEtHZGxTMGxJeUFVRVhoKzFITUt2YTYz?=
 =?utf-8?B?bWRXYWYzMzRHbkRXeTY5V3dmekhkMGhxOEdpWVd3MmdOR1NrUUdPM1FJR3RH?=
 =?utf-8?B?ZUNFVWxQd3M5WENLdm9peTFlZEtWU05jZy9kMDY4WVBnUFNreXdnMVF4YVZT?=
 =?utf-8?B?eGJCSCt3QWZBc2F0ZFVUc0lBSlVDYlFOYnQrR05mT2REanRTR2pZVm1uMkVp?=
 =?utf-8?B?d0F4VS93QWtWcTJxSnhTTlE2WXZHSDhVRDAyZ1phVTFPejV3WmpNc3B2OFRh?=
 =?utf-8?B?ei90R2lOSjJLRlB4MG9QZzJSOHAwL09VeTA5T29vN0VWUU83VDNCd0VzdFAr?=
 =?utf-8?B?dVl0cnpjdGtJampjSlVHVHh0U01PNWllMG9ERExrRkFLQXdtVG40TWJ4bW5E?=
 =?utf-8?B?ajNrcENVMW5XRlphOVhMK2F2UG1OMEdKVlNwQTQxQmdaTURjODhzdXhjOWxD?=
 =?utf-8?Q?oIlJ0+G3tcoDsUBSYNMdXCwjV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e3ca3b-3e97-4c50-afd1-08daa2026618
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:07:21.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2Y31Oj9Wo4DnOyscCbCGQN7OEyCd03TJOAnnjL2M4njh+EgqohyoLEbTTyxCZJtB5/KXJNOyeo21JqBVBLNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7080

On 27.09.2022 17:47, Andrew Cooper wrote:
> This breaks all Clang builds, as demostrated by Gitlab CI.
> 
> Contrary to the description in ecd6b9759919, -no-pie is not even an option
> passed to the linker.  GCC's actual behaviour is to inhibit the passing of
> -pie to the linker, as well as selecting different cr0 artefacts to be linked.
> 
> EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
> gain such a usecase.

Since it was largely unavoidable for me to notice this while putting
together the two XTF patches just sent - isn't the current way of using
-no-pie there bogus then as well?

Jan

