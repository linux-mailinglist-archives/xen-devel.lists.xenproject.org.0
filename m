Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596646FE127
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 17:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532888.829231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlPD-0004KB-C8; Wed, 10 May 2023 15:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532888.829231; Wed, 10 May 2023 15:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwlPD-0004IK-7w; Wed, 10 May 2023 15:07:03 +0000
Received: by outflank-mailman (input) for mailman id 532888;
 Wed, 10 May 2023 15:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PWYj=A7=citrix.com=prvs=487e665c6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwlPB-0004IE-Sj
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 15:07:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d04d64d-ef44-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 17:06:58 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2023 11:06:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7356.namprd03.prod.outlook.com (2603:10b6:a03:55c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 15:06:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 15:06:32 +0000
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
X-Inumbo-ID: 4d04d64d-ef44-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683731218;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p1S9mrpOlUpI2c1/yck9M7PzzZL+e4awhHsv1AAnzEo=;
  b=fHOagVraByUNtSJUxPtPRRxFXkdtLEWqsGmLYI55z6zn5scq2bBwDGDK
   nwIiiCGQwn60rIR/4gzBurX9zTV6NIHyzdsvPR0ls2ARosHNmFKAnJ9+J
   xma+QA6A+h19MCo+BnpAVwVRXjaKl/SzS0zSEEQ6ugbbMK/HCsbPJkajd
   I=;
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 108945977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UZnck6KWaWdKhEIiFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS3zwFn
 WpOC2qDbvyPMWvxLtx0aY7k90pSsJPTzocxHlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c50KFpIy
 dIFJwwIVS6iuOa12aKLVeJV05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXOqBN9DS+LQGvhCrXuN2zw3BhMsSXSr+daLmxOdBvcGN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAcAuN/qpdlpigqVFoo6VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT2tjA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:/WbkbK2BNPdcevE5CnDAvAqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:/CagomAsv3ffZAj6EypOz0goNN0qTnjm8lbvJ0yhGVZ2Q4TAHA==
X-Talos-MUID: 9a23:mJvC+Abz2+CSZOBTmhnymWFGOslS/4u+UG8/gMgl5uzdKnkl
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108945977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElJ00RoUBeOJbuCzJ9HitZxcxBqvSPSXKdBIyhNAVybgiQhGjUMLPMavpNZHSbmC4QlHlvgdrf6muyaWLUOAEvHald2VOgKT4bpcD8CNeY9ELj8nvgB6JWfg7Uzj6UQp1QO3e4N+mbbR3fNsw5RYtEat1X48s3PO3E7XkRhzKoppzOAFUcQl1dZgdEkNCx5pLXfnom5Hs8HsgiSGjzctieO7C1zRWyIOGkdvxoh8gqKCfAI0kakDzG96XRI1dRonT4s7gql6fohiTIz+ly62bo4yE6IYrwbk25S86Ewa5bcuO0zulOQPTgdjfgniyv6HOa88prZjz6hwzUnFi9sDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEvFsUI9Q4p68/Quq3FWuzrbQRrDJ7foZ838nz9TFlk=;
 b=JuEQVnCxx/bvTwSLPdurkBfsKSYfEklYhtsAC/xBGpB0XToEXiOXkpO2vzDGBwOYxENrF6wLoPpl7EpdZekOdDEdEVpFaezBvv9+Wz73xHDDk3UIssJ2zC0avSCP5Wp3EU2Az1BUHy/ExIhwk5JOUT4L1GhGbzcFmD5xGcf90nWIDrC+ouLRXk819nxOFXggTeKX8DPFszdgdk6RrM7bpe4I6sSZkmtNmPxtbXWItnplgUPKxeRekt96JevYxntHZQajYPAjWQeybfWUQS73wVJPZEYpfPdggTUnEQme5LyzoLjKJFH6JTN9fRczo+T4R0cVeRtbZXcxQqKfynutMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEvFsUI9Q4p68/Quq3FWuzrbQRrDJ7foZ838nz9TFlk=;
 b=bJT/UQq5TxgquTjEdbEAfqJtNP6hQKwpEkKZDzrV2BXbU5x8vXiGtsGbkbipjQLRCKb44SYIZVcGh47M8M4RhAVx0Z6YckUw2+xRI04NQVWfepXTGJdUsThRN0PFJphay/i9AubMb2lODSGZJ2madwCc/YaF5tPG2oFa/pW1HVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6d62ba23-d247-08da-3a84-ed8d1cdc4271@citrix.com>
Date: Wed, 10 May 2023 16:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
 <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
 <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
 <c8cb1df9-33af-8cae-291d-9a86a3b7f6b9@suse.com>
In-Reply-To: <c8cb1df9-33af-8cae-291d-9a86a3b7f6b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 09efb80e-4bcb-4abd-c7a2-08db51682372
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DfHjTE34KX7ngiTsTT6vZgcPOPIARb5PExaXRRwD5B7UXr49oDhHfE+0C+l6vot8B6LlUW1rL2HmAEqo45mPvLg+dDjFG8OTmDAqgL/vlRVcE2qEoM39S0OreNTh3w/U4tDW5HoM3JQoIAxIPmiakajP2vQ84gnPgLSXB/esUZ8wwaEwQUYnnn9cPcH9b+q8mywYcM7luUelgt+rIueF5x/9n0bJS8i3LOv89sO/dERdsOOVz21qSDjy1Bne4bfBpEd+/IpaXX2mxAg2Yqw2HTujaoEd82ikuZ30CytGxpCxsC3Eei7C5B5pj35baSQe9rP1cMGvVJc4Kp2RqgATOfS9rUZ85XLAs+PWHhFBq7+DVjtcDRzaN7g2L6r6DX96ca5cvG/nKiSQ71liQYb2YMkEXjeVVudBgj7m1WxbZAXtJ8sevE3kfBJY9BoqkLPM9SuHegiVlWO1BTeaeElyTZmhpgtiakGMXHb41JVdj6h6npJELDp18vjARl7c40nbxwAW24ivkESrlatYXselQto+27DO+qUQIgtMuqG9i+ueEmyYYRDm4mnZTz4y+v6lwPfuR+YymcEuo4G7pKm9ouVhaHmUi9IgGwHk4mjjrVeXMGui/2APKEN3dECNUun+hblkHnNHZ4JvUUFadsvCZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(2616005)(86362001)(83380400001)(478600001)(8936002)(8676002)(36756003)(41300700001)(5660300002)(2906002)(316002)(4326008)(54906003)(66946007)(6916009)(66476007)(66556008)(6512007)(53546011)(6506007)(26005)(186003)(6486002)(6666004)(82960400001)(38100700002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkY5cktsZ3ZEWlU3YllucEJOd3lCK01LK3ptVTNCM3U3ZkNNMDl1UnloT0Nz?=
 =?utf-8?B?YlRXUG5uQTBsOWZyQkNKVXVWRWpUdXEzUHgvQ2g4aFdieStqdVFrV0pvR0dM?=
 =?utf-8?B?R2h3d1kzcDBJM2w0MTM0YmxXUUpabHdSdEhLU1Q3bC9Ub0lFWHBYNFdzbWtG?=
 =?utf-8?B?bWRCK2w5M1p0UnRkTXpheU1vTjVMakRWWWpCRS9NZWU2RmxpS2EvaWppa2Np?=
 =?utf-8?B?bWdGeEN4Z1NGMk5zQ0E5dnpQNzhBM0NTYW1RTy9VVVJUb2diYjgzL1AvMURJ?=
 =?utf-8?B?WjlTYXZiSEFXbWtiM3NyT2xYbXR2NnpHS0tmL2VaNkk0NmdQRkk3bTlVOU9N?=
 =?utf-8?B?VXBubzl4cFIrcldreTJDc0FEUU4zd0FweTBMdVdhdXdINSs1WG9jdm04ck1Z?=
 =?utf-8?B?S3l5akFSNVVGU09uakZtS2dWc1Mzem9CeEhGTk54M1cvVEpNMUl6UmxWN0pn?=
 =?utf-8?B?QzVGRTJrc3JmQ0F0ZUtmWU8yL0s4aGlESEphYzROUHRaYStBMEV4VnBJemhV?=
 =?utf-8?B?TFpTL2gyN0VpL3pjbHZVNWx1Y2UrOTdKMFRlTVhPU2VXRGhCaDF2L3hLakow?=
 =?utf-8?B?MHRlWTVwUkRmWGFXZWRKS29QQ1VLblk1NVdQSCtub3kyV0FMK1RlelFkSkg0?=
 =?utf-8?B?TVFQR0NRZmVERWhSaWtlaERrNFlMRkYxSUJRc0RoNGRBOHlRdUo3eVFZa2lV?=
 =?utf-8?B?NmloRzVWSHhBQUp0VEhxQzZod09tcXRVYXFTdkExTXc1VnBEM01ldkI4RTAv?=
 =?utf-8?B?UHZ6Rmc2aCtJMStBT1QxRFE0U3NnRjJ3QmNXdGhpVHA5US8yeW9HS1F4dmVF?=
 =?utf-8?B?TzRRQ2RWc2hCbmVXemNzMlJndmxHOHBWejIvVWFuTE9XSFJ0WWROa2R2Qysw?=
 =?utf-8?B?WStuTzhWdzRpVHRnUDlrV1dJU0pjKzlvTzZMTUtLUndjZW91ZzlsRlhlVlR6?=
 =?utf-8?B?UWVKYVl2NC9PTklCR0ZGMUg3SWdJWkZFY1ZUZytQaTRwa0RCNmF6bWZNbzRj?=
 =?utf-8?B?U1Zmc0VjT3NkSDd6dFo1N1FwNmxPbk83ZE5xcXZHazU2VmEyb0tvcit0cFE1?=
 =?utf-8?B?NWRMdzJMc24veFk4UTE3RlBRUzRKcll3Zk5WcUR4ZWRvRGNLeVMrZUozMnA2?=
 =?utf-8?B?ZHVNcjVuZUVrL2tDZEtBcy8xanVvd3hjOElEM2hVMWZpb1kxMHZUT0hVYTdB?=
 =?utf-8?B?R0NFUVpSWlpHdzFRL3Fxdm92WFBzZWJacmdJOEg5NXUrbkFEYTZCRkwzdU5q?=
 =?utf-8?B?OVMwUEtvZDF1WS9mZjJIU3BERlpGNzRDT3VINDdEc3doMnB3MEFhZzdWQzhK?=
 =?utf-8?B?YS91TTMvbkUyeHZYM3NtNmpRamI3c2VaeGNSblJmcUlHQlhWU3VWdDgwVlJw?=
 =?utf-8?B?V3FibGV2YWUwbFA5RGp0SGN3WjBla3J6TXdSazNIZUZldnloaUhMZXJxQ3BV?=
 =?utf-8?B?NGFONlNsTWNDaW9VMk9vclo1NFBwRnZqTDNXS0trQVp5MDFnbGFoZExnOXhQ?=
 =?utf-8?B?Y3RMMC83aXFHWFBLME96U3RUQVhNeXpBdVkwTm1LamxYVjRvWnM4R2JaZnZu?=
 =?utf-8?B?aEJmTFpxYVM5TEltVlVhMVczSTZsSjh1YTI5UXFUeUNJSDJMV1pSeXhVUDdo?=
 =?utf-8?B?anAyakN4cEtnbU0yQXgwMUplMWVmN2pKaHZMZGVtQUdLanFpUlBzUFpCM3Vx?=
 =?utf-8?B?b0NHZGJsVkk4VW84cGRzMEYrejFmN2xqeDRUTWJpOGNnTFBnMTNiSnlhRjA5?=
 =?utf-8?B?QXlQaHYzc2F1OUl6Z3gwcGROQW53WGtuRDlHeWVBNlNoQWRsTThnbjY5SXFJ?=
 =?utf-8?B?UjVrZHErTmFxTzJLQnorczVoN0wwb243aUkyRGFWU2xtSGdkelVFMzE2SzV4?=
 =?utf-8?B?TWFQR2Q3M3R2bXdSbGprWjVYdll3bEl2N0U0NWxCZ0tjMXdJQmozaEF5YUpY?=
 =?utf-8?B?NHI3K0UvUFRERGxVY0V1amkwcmZ6ZDMzTU5qZURhMzRzSTFkTmw4T3Y4K3Jj?=
 =?utf-8?B?UDN6aXFRRHJOY2NScEZ6RGZOeGJhMUpLeC9lcXdXdWl2aW5FbnJUZGlQRkRv?=
 =?utf-8?B?ZHRmandzRFRMcDF0a0NuUzBZZDlrZHdhMDM0UVlRa3BZcXFKZURpMWpkeUZs?=
 =?utf-8?B?OUxseEtCT2xOMko4WHZoM0lwRmVXanVhNWVIM3d0cW1TNG41N05OVHV6d2N0?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oSqAl8u324e6+SFI/a1RjCdR6G4iaREpeqDDACiFx3w+Kv4ql+3x2i+1Di8FzhSkhIaIYONo2WUO2QgcLXIbe8MExKJe7kzPdIRFxVVPslenrdxyScqBcIoeIb6YFVneKmL7+hAXKUF//TzoqtkTnoYfJ7W0jjApbBCZmHi8UUXixin1ZKYbX5RQaPnMGklWJjuO2uzNuyyaX57cSeK71+kOPxJMtUdKHblYGhh3yGX8RJCrR3+ezVTFp6+hNHdSYH1t4UvDBhRFwe2CFrraqQCyAi5J+QtLrau28X/foBlx7eR0a7/BvNMF/+LtmJQpWBkaUvxH8kDas923sVsksqgC2W8h/pHUE6rJjUxprxeJYdYWmMLP8/ATU0d1lQ0zy1weHDGvv4ERW9jIIkFO9RuCYhwg0xgQjp6u9Yv0I5pk8nR0tuF7JSraiBE4tPB1ortzgNuX9C18pAvv7VgmO4ukxSMHDfsPWePAzACUPGQLAmiJTpCueYO/DLjtcKAaoCGDydjvEfuyByzL+AyoTdsLFc1YIfHk4oI9sH6xj+IGkL1ylv4hRRqHOMK3HEmT2SnwTSi5RDFna4v8JV0SsVz5hXmjfWP4ezeQl6qZFSzi1/c0bIlM9o5WFTqsc5Qro55aYC9wV5UtubW6B7D4J4NAgZNzH0/Ms5vw8LjQlJb3WCdxnC2oZtdkVqXAioFgqbSBH98APBfpw5wFUWRUfVsrkWfw9TyLSSV4L97eA876+AJ5HXcR8DKMRegUizPn8RwMICYfM3QM+qwGlSv2mWNZfzLUlxlVHLI9ySBgFhvVo5BITn+NHqe9aPUkKvSt
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09efb80e-4bcb-4abd-c7a2-08db51682372
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:06:32.1046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNcckj+lrPYebPeTVp8yIZE/LB0ELfOWYJ48267AUvBPF2lCRvz2brStt+CfDnuO0MupLy2tKQNnAMnPRmOGI1wfQlP2APxnbNMQNYnFDpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7356

On 09/05/2023 5:15 pm, Jan Beulich wrote:
> On 09.05.2023 17:59, Andrew Cooper wrote:
>> On 09/05/2023 3:28 pm, Jan Beulich wrote:
>>> On 09.05.2023 15:04, Andrew Cooper wrote:
>>>> On 08/05/2023 7:47 am, Jan Beulich wrote:
>>>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>>>>> code which looks like:
>>>>>>
>>>>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>>>>
>>>>>> However, GCC 12 at least does now warn for this:
>>>>>>
>>>>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>>>>         |                        ^
>>>>>>   foo.c:1:24: note: (near initialization for 'foo')
>>>>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>>>>> the arrays in question don't have explicit dimensions at their
>>>>> definition sites, and hence they derive their dimensions from their
>>>>> initializers. So the build-time-checks are about the arrays in fact
>>>>> obtaining the right dimensions, i.e. the initializers being suitable.
>>>>>
>>>>> With the core part of the reasoning not being applicable, I'm afraid I
>>>>> can't even say "okay with an adjusted description".
>>>> Now I'm extra confused.
>>>>
>>>> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
>>>> when I was expecting one, and there was a bug in the original featureset
>>>> work caused by this going wrong.
>>>>
>>>> But godbolt seems to agree that even GCC 4.1 notices.
>>>>
>>>> Maybe it was some other error (C file not seeing the header properly?)
>>>> which disappeared across the upstream review?
>>> Or maybe, by mistake, too few initializer fields? But what exactly it
>>> was probably doesn't matter. If this patch is to stay (see below), some
>>> different description will be needed anyway (or the change be folded
>>> into the one actually invalidating those BUILD_BUG_ON()s).
>>>
>>>> Either way, these aren't appropriate, and need deleting before patch 5,
>>>> because the check is no longer valid when a featureset can be longer
>>>> than the autogen length.
>>> Well, they need deleting if we stick to the approach chosen there right
>>> now. If we switched to my proposed alternative, they better would stay.
>> Given that all versions of GCC do warn, I don't see any justification
>> for them to stay.
> All versions warn when the variable declarations / definitions have a
> dimension specified, and then there are excess initializers. Yet none
> of the five affected arrays have a dimension specified in their
> definitions.
>
> Even if dimensions were added, we'd then have only covered half of
> what the BUILD_BUG_ON()s cover right now: There could then be fewer
> than intended initializer fields, and things may still be screwed. I
> think it was for this very reason why BUILD_BUG_ON() was chosen.

???

The dimensions already exist, as proved by the fact GCC can spot the
violation.

On the other hand, zero extending a featureset is explicitly how they're
supposed to work.  How do you think Xapi has coped with migration
compatibility over the years, not to mention the microcode changes which
lengthen a featureset?

So no, there was never any problem with constructs of the form uint32_t
foo[10] = { 1, } in the first place.

The BUILD_BUG_ON()s therefore serve no purpose at all.

~Andrew

