Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B23BD3A4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 13:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151158.279386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jfF-0002xQ-It; Tue, 06 Jul 2021 11:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151158.279386; Tue, 06 Jul 2021 11:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jfF-0002uc-Ee; Tue, 06 Jul 2021 11:54:57 +0000
Received: by outflank-mailman (input) for mailman id 151158;
 Tue, 06 Jul 2021 11:54:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0jfE-0002uS-21
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 11:54:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d87b4dd8-80bc-4553-a0eb-a92f5c612317;
 Tue, 06 Jul 2021 11:54:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-zwX_PQicNGuFIEK5zcMA9w-1;
 Tue, 06 Jul 2021 13:54:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Tue, 6 Jul
 2021 11:54:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 11:54:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:54:50 +0000
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
X-Inumbo-ID: d87b4dd8-80bc-4553-a0eb-a92f5c612317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625572494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qo5ntVrsAUdxoFW46nFFT7VS/THwD9rNO3leC/egNs=;
	b=J/2GiYYqxwWuPCQztBypUppmzycDDuq23reCCDO5eQ2jSyGDSlAq+KCnge8Ai9nzv/XfJn
	Iq0HeZps2R3PO6Hstk2HwUizZDmlMdfubrJ52bCeXnfYPsgJF0sl5xsucUZD7tL0nCAENU
	IHI3lqC/SVcHFCyNk25sklZKhCBDAUQ=
X-MC-Unique: zwX_PQicNGuFIEK5zcMA9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WB0wfvkpsAOfQXGjZw0YEtHqOvRjjzIpfXhq2t7RmL1e2BNfXvx0L/RZ5fOqt/NQBzYh6xL7kNKJFCE2C9LS1i69q9eiLwGC97SYMoE7gX7tJmfK1WiURhxE3caCYrjbnP/6RflqmM5B+tmqI7q2BAFg4J4KHAe2CENtGFeHcO1VqLCQOWTBY6pHdbOC5zx61WJkzy/uhV/pYfs0yyf/y0tGWRKscWrb0PRRVLigEyNbW1F6J3C8V0d4QlkF2tIt90Phuq2UmYJlBsuOZeHZ9xjjjGqFWusOlIfeZJe5J/zCZjSV8CSyROr4vCAZw3m8gJrGZVRPkRPvJKB4f0syyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qo5ntVrsAUdxoFW46nFFT7VS/THwD9rNO3leC/egNs=;
 b=ly5H+MdluZ7P4cnvG+1pthcpg4/2Tjr19UgX7QCJSccAaGXeB/Kv4SDHUXc8rz3NlzHT6H5BNzZcRgUmUge/s5ZWZ+BU7mHf5TUz35Wt6sbW4h3rpSgrE4Ox9vUeBTn748t9gHPXfx9QiT0zaUYKzmPbEZruDZU7VpLFKsJHitlMUM5vkBUXf/Hl4MWeiUoS+rE1WpNbUp0K4Xk5VzTbwerLvgi0gq1SpZgbYie9SFqCTGlYWkZL8LIDkBGl1a6dOV0PKeG34ZI6AK4WNM07ieEkWBemkWMTz0yV/P3g8XZxErMQe0DI0VNS0xuxmqF6TODlAKyiSdHSC2HXs7XSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/2] tools/migration: Fix iovec handling in
 send_checkpoint_dirty_pfn_list()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9157297b-ef81-75be-f903-e0e9d2f64699@suse.com>
Date: Tue, 6 Jul 2021 13:54:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112332.31753-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0039.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5b7a2bd-b13a-493c-6b73-08d94074dc79
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038BE7F80F0300E7A6CD132B31B9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YhmEtlqRkSE1cr4q9vfmwL7TAUiyuddFPk38cKQyMqvXIlQ4+ycZJ3FbGpulnUwF2OVLIU8Jac2Gpq31utydgR0W4iHOzaibdkg2H7aO2gwQmHkHzEWM8W2WApwjJnFufYyePCAYN+bWJYapmK+MYPWzPCRz9zdlmWbPc1gSQ3ddsbP2tUGLAHNQjWtiBscbfAWFLRh/wJBfILWhH2uOFDF8wH32qpB7T1TOzPiiRIgaXKrGvJPj/VMmYZGwTc8XR+DBzdsxDuoHvBTGnpyCR2ZaSL9X4ypwdu7yG7skHejDZXnTYEx8lG6Ckua+BKQV6faEI4YyIEs4edJpdVCIq8Rn6Goy6VhYIh+IU9DO792lahZYjIXQbklLXJVfOwY+cvbCOmu48i2mdg8AEQpzbx9LM0Lj+JKzIqeYNADV8t7G6kARlV9ZhZ+p41YVKrtUr5BcFVYnw899QNRMdNsxVEToO1qrRQsn5rRySaXyq2TS2dZKLTo3Q+2FyjeK+TnxMMLw0XrhA8Si3YLf4201aFMgKJLpubNUEzgiSq3VuYb7ZXnCkVKxLFzQgvmL+p6oGnT1x+cNIZ4l6Xe0oQVBwrVaaiOlTKBKWca5jir/G1KSEwrAWk9MQijjXhrY+JA6vG5WwVDnonZpZGjqXfT+DtwvF4HzGXvDKqRnr8/6B9lzFnb4rqf17HQyB7hXOrH2BsbbtRYLZq8LLXOdbDa/Gv8bghJfVAQCNSX2dA2dZ10kvtvGx8iFUTGvMBUuAw6j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(6486002)(6916009)(36756003)(316002)(8936002)(31686004)(86362001)(16576012)(66946007)(186003)(31696002)(4744005)(2616005)(54906003)(38100700002)(956004)(2906002)(4326008)(5660300002)(26005)(478600001)(8676002)(53546011)(66476007)(66556008)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THZ0QVcrQXJlVGU0OVV0cUpzbWRDWnloRUsvSi9Hei9tUytkZDVEeTlZelor?=
 =?utf-8?B?WDdWMFJYaS9lSnF4ZmtWdHFwWnM0Y2dqOFMrd2gzRTdlYjVhV0dYM1I3dFJT?=
 =?utf-8?B?c0pHS0FMeWpuYU1nR01HTVFnQzFXNTZhYVhHNzFvVzBwa1BJUS9lZ05tU2Nt?=
 =?utf-8?B?dzVXNXZpamNYZDUwYnRlSWlMSDdWa2hWam9teG1oNm5qS2RGT00rN29CQjMx?=
 =?utf-8?B?UHlodXhnd2YxMWc2WHA3SjlMK0xUejFCYlVlUTVrQlZCVUxEVEZjY0pyekFx?=
 =?utf-8?B?cTk3NU53ZzVPSExtWEYwS1VMaEM1RHdsTXFGeG9iSmc2SGlZQUpFcFhpcHlW?=
 =?utf-8?B?eHhsME44WngrdGhndnhDcEU0dEEzUVJpbTNnbUM1RXZ3RFl3a0JDTllucHNL?=
 =?utf-8?B?K1Rnc0tBZGg4dnlGc1Urb2VyR251b2NXaks4SjVNYnRHbERpcEtHb2tYZUti?=
 =?utf-8?B?ajRqOEdDV0FGRDlFMDJpbzJySXRSajYrbXpsS2dIR0JwMGxOeFJPTm9SQUl4?=
 =?utf-8?B?UUtCSWpsRVJjRUtUNUpVak13QjFVV2pUK2dZR2VESUdrQnBMTGppZW82T3dM?=
 =?utf-8?B?VUx2aDVrb3MweDhTUUxHelIxSEcrcUdCWXpWZE1hL01vVzNrZTBTOGEzT2M3?=
 =?utf-8?B?TFJGenFNQk5GRE9xOVdqeWNOMy9ob2xQdjJ0Q3FTVTFQV0hKbUhGT1g2bTVm?=
 =?utf-8?B?OEUrWnVKSk5RQWdZVlhWUFJSVFViTDVSM3NkeG1TWE1OMm13alNLTFo0TXg0?=
 =?utf-8?B?QUNUVHQrT3A2bm9pM1IrUHB0NlNtZG1mVGp6SVh5S3ViMlhOVzUyTlNFa0ph?=
 =?utf-8?B?bEFyaVl0SFA5eFZOK1k5a1YrelFwWUJMUUdEUkJFa01QdWQydFpGRnR1bHV2?=
 =?utf-8?B?RE1OV3lqZHlRVWFaa04yM2hCb2FZd3NqWGovRngvNjc0NFJUUEU3eFlBTmFu?=
 =?utf-8?B?S2lkVUJmL1QvR2hBUlpPdWptOG1KaHYwc2paWm84ZW9Sd3dKRlpCVkZ6aFNm?=
 =?utf-8?B?cXFvOHY4U1UrNmk2R3Z2RWxHTExPM3oxYkUxQmxWS3czVHJWRFFXdTloVVNR?=
 =?utf-8?B?emp6V1ErVnhDWm16U21Gd1RFWDdkcDlQdm1YV3R3NTV6L3VWem1oK0JIMmo2?=
 =?utf-8?B?U2JReHdmd3hLb2RCcU5ZOFR4L2hRSndEZzYwV1VkR2dOVDdJZEtYcTBsb3B2?=
 =?utf-8?B?NGY3REFLSzluRVEvc2VpNHhZOGFEMDMwMURUVCt0eEliVGpORGhGRDdMVzVB?=
 =?utf-8?B?MUtJaUVqWHFjUUVzL3ZSWGJlT2NuenNnd0c3bXk3YlA1WmtYQlpybmllcVZ6?=
 =?utf-8?B?aTJqMVBYQzhYcWYrU2dTSVJ0Qm9IWTlQTGVZaVd4Q1FMZy9qb3hWejlZZVh2?=
 =?utf-8?B?aU80WHFIWGZTYmU2YzNXMGpsN2VpdVl0Ym1ZS0VmS1dJdXMrcFBabmk0bXYr?=
 =?utf-8?B?dE0yYzFoSTJpS0cyNGp6bjBMRE8zOThGOWVCcDJBTHN3b25IRzBTV2wwSVRm?=
 =?utf-8?B?NDd3NUl5MG82VTRjS0gxWnlpS2pLQ1J3MHh3dlhVaVpmZWlHZEV0ckxmbzRy?=
 =?utf-8?B?MDQ3aG05OU5uazc2TXkvQ0FVUnpJMzVJTzFqTEptNE9JRHFNY0xXMnB6UDNC?=
 =?utf-8?B?YUVwcWY0akoxOVRLeXpWS1JTbzkvbkZES3lONlcrL0lmcE1xekkzZGVMQ1Zp?=
 =?utf-8?B?cTAxaktYK0xNZDFZbmo5WC96cCs2dWFtaDZ3aUlkUkFpTFhiMDVIWlF2cFZS?=
 =?utf-8?Q?9Z/DSv+feYF+Fr2MDJzewtQH9Y5AfQXNXNusBtj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b7a2bd-b13a-493c-6b73-08d94074dc79
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 11:54:51.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opgx0kMxcbfRR5ZJGsD/KI7XE08cTC/hAefTCWR8foWoJh/ZzDZCOf2TGDiJc3FPp7+XqvvzUJYaIEsQkpakWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 06.07.2021 13:23, Andrew Cooper wrote:
> We shouldn't be using two struct iovec's to write half of 'rec' each, and
> there is no need to malloc() for two struct iovec's at all.

I was indeed wondering about all of these while also touching the
function. But I was guessing that there might be a deeper reason I
don't see.

> Simplify down to just two - one covering the whole of 'rec', and one covering
> the pfns array.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


