Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6073B5E6A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147859.272969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqkf-0001BC-3z; Mon, 28 Jun 2021 12:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147859.272969; Mon, 28 Jun 2021 12:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqkf-00019H-0o; Mon, 28 Jun 2021 12:52:37 +0000
Received: by outflank-mailman (input) for mailman id 147859;
 Mon, 28 Jun 2021 12:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqkd-00019B-Dk
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:52:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f4d0d4c-1f03-4f06-b60b-1d1cac113edc;
 Mon, 28 Jun 2021 12:52:34 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-hANrjQ4vMVegjTrIas9qCg-1; Mon, 28 Jun 2021 14:52:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 12:52:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:52:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:52:30 +0000
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
X-Inumbo-ID: 1f4d0d4c-1f03-4f06-b60b-1d1cac113edc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624884753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yVJNCo1sNX/APcKFoae9hxZ2G4hFWbGPjS/ATQ26mDY=;
	b=QZvVLaa8leJMnC1xbkWgE91Rpomlo61zZWENxfFK7bqZU1ippoeZ3ujvI9UtOEsvnCGa6z
	oCcgCVz710y9RJdRl7820Bnj+a8mrqUcg9ITtNfzDBWBM9BB9Ogj434ApYjHAibTl6b46T
	uaVZRHwhoWavV7cVhFkK+IWJfOMpvs8=
X-MC-Unique: hANrjQ4vMVegjTrIas9qCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehghYznthXVfKfH8EQjcgMq3kG4vZG+1hUVZ/P3iQGYXwY0539XL1nwfnzY9e8uEDsMDc3KGiD/m7jxGa5MlkzbQa1C2eRPbctd2x+PGw4UxyEb4FOCfWjab/o5Z6zF9R6o/lGw4ktPY7cnrKIYqcRUEvXFsHo28DnaJx3YpuFZWMO2wrArlWbBowuhyA+amDKAVWykU4wK4GQSwT0HAn5J3jiEEcaV5VgBkybYUGgfHreI6/Znz3DKobR9i1uwV8e0jH6vvhSj1Ab/t8ddpThbwa+u3ZgL1wNLcavlIMOpYfS6uaAvWz5KbN6k85D2CyIHHMPv9DktCp2+6OFE8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVJNCo1sNX/APcKFoae9hxZ2G4hFWbGPjS/ATQ26mDY=;
 b=aeKBxEtnOuCvHQ6p5K3YQyyFx/2v+HeIby8rD3/WGsgDWx5ixOqbK/mKxPGAbksOgDViYU60z7JdsfBtPGCdDVQdo/5EkUY7lSk8WXir34CH89xFukIr6H/iWN1W6zcCPxFJ+ACl7Oh9vH6jdsDxscVKvHFAXpLrLIWXewdcULTOyHi2JpJDcM0XFvkn2JCACcOtXvuhnxb1nbmwEBq6MXRQmp9qzjeY/gKQ1V+m4Fe5gPRO7c83wzOi9xIOh0vfEQ1tlU+mZSkOS7ve/qdfp2OXQvGFmVWSsIXoBh7ieUoi1iyOYeq1tB1gQDz7Io8YUmSyyc61qDqfq6Mo2UD4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/4] tests/xenstore: Rework Makefile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
 <20210622182124.11571-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <290f1e12-0185-977c-4a6b-3cb8fe9d919d@suse.com>
Date: Mon, 28 Jun 2021 14:52:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622182124.11571-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef05a5dc-f3a9-4c63-c397-08d93a339787
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958F72C72EB30936EEF775BB3039@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dh1k0uWI/uezsSx7BC1xIQR7ZTl6vaaEoNN0JIPm9vrktKsTlX10fBxr6LHzMsVW1mj5PkbUuJHPu2JGtFnRaEZF14P99EWAMYpSgVtM8e0R4MxzSe/5JxwmMIuehoefY6TkwgCaj70aMTDUqvXbobVAd046HkWzs70HqkpaSVxvf/rqi5gFi9V9IRJTvtH9mluwoWwzThN8GqcSzvuM8woxRuG3YrJb/E7bw2+qB93NkGjRQcI3vuhQ7U8c9QsWSGuzegf1gf7uywrqoUpRVXh46a41liPDCHjss+FewNEaPIZtA+uzqMUZouhW37mSKN3s3T51bqHm3GsqrYXxdo+a//RriJMQESfg4KbWRaMi2qcy8008Bo7JaZSD3BwwltMAPHspaqOnR9dda1EsUoL6i+UutQ7muPSLP+1wESf84XK39S+vvuu0zMCbUo3YdPRa7GsLbdniqBZ6xJu0+Ustw2ekkC9mpnrU/AmVO8LeYjp4/b47YPBN7+iLGl8NAOzRipxA8GULzEJpxWD6YKJ0OJuLJf2Q3HUS4HRfcv/u5na9239nuQs9+djpZqty56L5rnbEIRMps4NvMusVB4Gfb9wbSnxldOwFazH5i+bhSbNe10XON35DD6JlOW3h6JmAAOwgRglJX3LZlOFBaWWS//5YsPAo3cBfAmffw2Y/5eawTn+6UPd2iscpO/bB90Kzr9kzqHryiyBt7smIhPEBVV2M99WJSlz9zoTr4LY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39860400002)(376002)(366004)(396003)(8676002)(53546011)(6486002)(36756003)(2906002)(31686004)(4326008)(66946007)(478600001)(5660300002)(86362001)(316002)(186003)(2616005)(31696002)(83380400001)(66556008)(66476007)(8936002)(54906003)(4744005)(6916009)(956004)(38100700002)(16576012)(26005)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkh6aldsRDRKU2p1dkx2K1JNL1ZvTGNqb2NDZUVidEZ3QjFnc1kvTlFqSG0y?=
 =?utf-8?B?Yk14Z3ZWVHl5OHpHaUYyOEpseG5uUkNZcUY2aEk1UmlGUkkxZ1ArY0IzV0J4?=
 =?utf-8?B?M2hLOVROVUhZQitaSkVNYzJoRnJiVnFhWUZCL1J5Z0FFejhOb0krRnlqWjJi?=
 =?utf-8?B?eFJrWjNWSlBVa0Z6VzRQcFZaMzFDbXdJY045b0s2WTNaZTZ2WEU2bGNMdith?=
 =?utf-8?B?Y2k2S3A5TGR1VWtRSTNIbTVVejJhekhyOTV4TmFPUG1jS01YWUFTdC8yQVlp?=
 =?utf-8?B?SGczMFRlQStHRzdpRlhiblUwYU0rcU5sTnZEL1o4d29kV1VtY2RVYVltM0pH?=
 =?utf-8?B?MXVKRmtPR09vam9icFNJb0Z0NC9BWDhDMmJsQW05OVpjNDJxLzZsdkJ1UG5Z?=
 =?utf-8?B?aXoyVEQxUHZSUW9uRElBaWl0dThYbGRMOVRFcHp6aVFnMnNkMUNhZ0NhT241?=
 =?utf-8?B?T094VllmY0tVYWw4V3lPTCtpQ3FKRU5abGNHR2JKbE9PK0N2NkFzbGI1TmlZ?=
 =?utf-8?B?T0RYUmpKd3oxdmpUUVRLQjRjaDd6RDdZNGYwNVd0bUQyK2ZENHlqcTV6eTBx?=
 =?utf-8?B?eXM4Q20zUWVtODAyOUNudFI4L3p2ZTdtSmMzRFIrM08vc2FPUGhFT2E4NFJO?=
 =?utf-8?B?ZDg5TnBCZkFVRGZFOGVOd0Fjb0d3U0hDWnIyTzBHQmFweEs2d0dPbktZOStl?=
 =?utf-8?B?bTV1TFVHa3pkSDc3RzRtS0dTdW1LekdKWDVtQ1U4Mmw0YklHR1B6L21Pc0Nh?=
 =?utf-8?B?T0VHd3RmRS9QcDlwVlhUWUtKVTU1SnlpdkNuRVMxNVRHdEZsbU45M1EzNmUv?=
 =?utf-8?B?R2RaOU9EZ3hzZEFYWWhWcWkwVisrZU5FcXdTV1N4U2JyL3FIR2lBdks3Vmho?=
 =?utf-8?B?ZFpJK1JJdFBld3dPK3lvM0MzUExBcW9pelFyNmtwZE1HOEMwb2xYRFQ2RUJC?=
 =?utf-8?B?cFBqVjB0YUZzUlNUNDdmSnpYZWU5Nk0wNHRGZCtabUVIaytGclR2THBGSmtp?=
 =?utf-8?B?NnM4MldYY2RyNVg2Nzc0U1ZnSkNWRjREZFByS1ZGc0RZQkdZYmUxcE5oNkdv?=
 =?utf-8?B?ekdUUENFYVFZeVlCamFjOVVEYVM0WFBxSU1aeFJMa2M0ZTlnb1NEUk4xZnRK?=
 =?utf-8?B?WEpveFdzQ21WODBTakN0cDJqdmZqaG9FUXQ4bk04S1R2OHFRTzdDQmpHaWJV?=
 =?utf-8?B?eEt4T041OXllaWJYN21RU0ZMd1pSSlV2N0tqSUVtS0VDeGdLbXhNU0VQTDdB?=
 =?utf-8?B?MUN1RGRVLzRNRXVteEloYlZFYXMrcFhrWWw4YXpsQ05qSnB0ZDRyTWIxcExK?=
 =?utf-8?B?RUdsZWZxcjdPWmtLRVcrZ1NhYjVUUEozZjYzbEFZYjRFQnRGTUd6ZlZ3WjJo?=
 =?utf-8?B?OHhaYVYxaW9JSmYwNkpJVVg2MjBsQVp4OEVEekQyVHl5ZEVsYVRGR1pIUGdV?=
 =?utf-8?B?RS9Ebm8vWWNnc01kRnl5dTcvNldTWmVhcThjdXg1V2FFb2hBdGtWbURPbVNj?=
 =?utf-8?B?b2xZQ3pmeEUvRmtkbjcyaDhYb240T05VdHE0c3BaeW8vM3FUUHM0L2FwdElp?=
 =?utf-8?B?WHpuZkNPOEl6VU9QKzBhYzNDb2N6Q1NNRkFmSDZuZTlPV2h1d29LN2pqWU01?=
 =?utf-8?B?OFNsV0tSWGRoYlVjNnNwWFhJTzNJYm9kN0dJYVMwUDVrcHN5UU5qYTl0WjlU?=
 =?utf-8?B?SWcwK0tIUzBtMlNaQTQrL1llaWZsS1BvYzNhMGprK0xhV3lPbXFjaU5zaXAv?=
 =?utf-8?Q?vvNpFKkd4R706vQ5NhulZvwnFBVtt3wzXO9qCm1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef05a5dc-f3a9-4c63-c397-08d93a339787
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:52:31.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Z74VUfQE2Wv38YzhQXmt1QjPJchiizGpAHfFr4i/CivyNONI2ydWc2CT0ACz6b1jmL+j9Z2+AzY+QikILqNoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 22.06.2021 20:21, Andrew Cooper wrote:
> In particular, fill in the install/uninstall rules so this test can be
> packaged to be automated sensibly.
> 
> This causes the code to be noticed by CI, which objects as follows:
> 
>   test-xenstore.c: In function 'main':
>   test-xenstore.c:486:5: error: ignoring return value of 'asprintf', declared
>   with attribute warn_unused_result [-Werror=unused-result]
>        asprintf(&path, "%s/%u", TEST_PATH, getpid());
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Address the CI failure by checking the asprintf() return value and exiting.
> 
> Rename xs-test to test-xenstore to be consistent with other tests.  Honour
> APPEND_FLAGS too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


