Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB4736806
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551486.861053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXrP-0003Af-Tj; Tue, 20 Jun 2023 09:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551486.861053; Tue, 20 Jun 2023 09:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBXrP-000385-Qk; Tue, 20 Jun 2023 09:41:15 +0000
Received: by outflank-mailman (input) for mailman id 551486;
 Tue, 20 Jun 2023 09:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBXrO-00037y-1L
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:41:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe16::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96053a1b-0f4e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 11:41:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8718.eurprd04.prod.outlook.com (2603:10a6:102:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 09:41:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:41:03 +0000
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
X-Inumbo-ID: 96053a1b-0f4e-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNxDDeqe5RFR2LV8Vlz6xEBf1hSlDFKruBDSJU1B1QFZbsWWig6SMTglxkeSqAkMrsnjfmLm338yJR8rdh8Xz9R2cY/FoBXnQ1lRWVpdukzo/HxzifAGz7wu1nNYT9NK3XGLB0Lc1xK53KLLS9ZjsQyXoaa3ylUn0fEjeiAGEdnsjqlifgBh4nw7bfBkfmQcFzvEJAWinAOu6DQ3X4A0cCxLQmV2i0vC+Pd9rjxnZwf9RwHAgrIq+uBacMecBio4PmR8nIUZTeRntLZJvioKUfuUMFbnIKFvQIzr7IAZUMwJzwm6VncokUgrG/4YkE849A8rLyXh+/+GSn/daJuo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN4Oq29+JAFfFFyHN767VOXTCL/YVjDSCdjrrHZBjNY=;
 b=kAzov4rznezBAQF3+MGIVS2Dn8Efka+wkrZWe5MJYcdQzkp3OIp7yfSDG/15eoO0dxOKcYXpRXF+0yzIPkq/VYEgnH4OfeqnxsW/gAF/VhDqNKDDZtgdhIqu+4QcRgBg540VfYj1bz7MlZHb4PzMhqqu/tOYA7vC2K4q1H0w/MYJYTjAaSv92j+w+GDl440bQCWD2MQmP9ucjrl4WsVz2ZUIQTN4DMB4NF6TknodLbKNdXhswX++AsMVbc1c9hi9UlEv5+gD1bvhcyJsyMN71SjOS80wY0/d5cmwM9HTXJ6kH2auIvkNJYbpgs3T4s10Lr39XUA4/llFSRBRLf7wFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN4Oq29+JAFfFFyHN767VOXTCL/YVjDSCdjrrHZBjNY=;
 b=EmZsc2arADF3dMv8dHwS7lK87m4AC/nmywgsMF6/7laBES6H6iON3/mZZEv+tVIUgCksZFgNV5L2fkoSGACif255UWnGvH6Gm8cjKkGT4QLB/sheIPq/6j64MW6YsxYKB2N6dhidRZKfLfOMgR2LYd/dxHJGY6SYjCtkt+teGur6y2etNd4LXkQKQ5kLsk4SOb076dXIVNXTALN5W0tymc91PGzwx+68ohurrA7ERf+iBH9oQyVic7fQG4fIfNjday5WY+XFpdXS79hUnBQowAxJfdCM0YCyC1vMsn52Hj3dkcIwOvuvQK7UsvH3hnK1QrzPlfoqyS5abGYFPHvJ+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d48d7fce-8032-beea-e1df-b4672e81f786@suse.com>
Date: Tue, 20 Jun 2023 11:41:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: a5555fca-8fe5-4a3c-206a-08db7172766f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPVBWLGcnpTlBWsI+cKjGt6G/SnQZzC46I+5SdupMPTC0hKLjFGwxTK/qKVhntkks8HYHWTraYCzTON39sdmQWT9rTYSvAp+3/yyek2j/dzDsf7qAfxdwhIhOsz65J6I5DzdNx/xoi4bkh+hRIh14dQFO22cETlcR0sLw+eqOekMSKDy9n2VLze57UvlOwBCsxU+kWmU1E+aXQlbWdZLnxH8OzpzphCK/JWL6pkk99Z7vTom3CDsxCacfpfnfRW4WBRJl/dH1ypAlRPQZ8fl5dg7prEV0Skx3iW0mhQK2l9CdQqg+l3QVf9oPC2ywiRJWcSsDVtvp/fqIHqiu/bAVbp5gOmWxQ0eKHlI1+gqfwq+OJ5Eez88XXzKNpCtmtGr6LMNfaSf09a6ruyOsg0Wh/4X/AoKCszXr3LVI136QzsBxqXP2/hm13WmVokb6H/h7BAy0Sg0rUgHydneiIWVUxWAnoSwx7an1idUwgDnLs0sMhMLjSj7a7myY2AtYBChjVcH6osN/16swNFlydKoJANFOetYEFsXPCPRy5OHCRCukuFayq/AIvxhBXFPXWq4dd32O07qWyLgE9rO6Lz3xUqp2zdnA11iwKlIP3wth0tYcXu4torGtpsmAogMBQEhIu1WwqyqP0Xky2s2F14dww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(31696002)(83380400001)(7416002)(31686004)(6486002)(54906003)(316002)(38100700002)(8676002)(8936002)(36756003)(6512007)(2616005)(26005)(86362001)(4326008)(6506007)(186003)(41300700001)(5660300002)(6916009)(53546011)(66476007)(66946007)(66556008)(478600001)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFF0TERpUFJLQUMvTW9qQldOOVNTVS9FME9ydk9nK29LL2VyYkRmeFFzajg5?=
 =?utf-8?B?UkdsejM3Q1kyT09TYkc3T0NtZUhKd1dacGQxZEpHK29JYktCVzMyT3J5M2NB?=
 =?utf-8?B?ZG5pa3JON2tad2xmTTgvOUg3NHIvZnlzSjVYYVlhbWtVT1p1YnQ3czdsV2Qv?=
 =?utf-8?B?OEtPOUIvenN4dThacVAwc1JvZnVQZUtrTjJKZFhQRUU4a1NGcU5sRWdnQ0pp?=
 =?utf-8?B?ekNabzk5YVNpeHh0bmNWNUpiYzNldWF0M0U1WG16N2IxZ0VYMGJnR0JncFQw?=
 =?utf-8?B?MFY2VkNzRHZjS1FjZHdwanhDVXd6amxrLzVzcGYrQmtBRHpyTWVIOUVqZjBR?=
 =?utf-8?B?WVEvRGkwUW9xdld1MmJ4WDl6VG1WM2srdUdxRXhYQ1VxelR0NmpNNFVUQU4w?=
 =?utf-8?B?eEtGUHhVRjF3NEV1b2xrcUt3SVY1MkNPeVNIYjQ3TTVmK3pjRjB6NDk4RU13?=
 =?utf-8?B?c3NLdC9ZRjU5Mk14a3NXaTZpS2VQLzkra0ttQnVmdWZJY0NCa2dOVXhWVi9h?=
 =?utf-8?B?bk1BWXd5dGpManhubUYzdWtIRzFvYkdpcm4xZ0k5ZjB6eXBUcnFPN0RTTnBC?=
 =?utf-8?B?WWNEenQySGx0QnVhYWFUenpDNEgwSVdTUHc2Qm1JblBlTm5YdzUzVEo5K3Vr?=
 =?utf-8?B?QWlHU1E5dnk1QzlUV2cyNm5VQkp6WmlJbDM0cElaNENSSFRTbmwweXp5NUFI?=
 =?utf-8?B?YkdCMm1oU3pJK1hTNDgzVXlzUVg3c250U2JUclZNWmJWVGdVN3drWFc4REdF?=
 =?utf-8?B?cGZKTEY1SC9DcmZQVVYyTWxkSDJuNHhjamp4WmNjWGpZNkUvaGZRWmpWc2lE?=
 =?utf-8?B?V0xFTlgwbWVtQlJOeHFxZDNTRGlROTR6QTRmeDRaZlpTR2tUSll4aFQ5WWJ3?=
 =?utf-8?B?TnJuc2xham82cURMZ3plcmY2ZXhOaktpakNvT3RBejFxRnhFRXBadVJkamNS?=
 =?utf-8?B?QUVTM2VHbzBVQ21Wc283ZUxFcmdTWWdNVFRTSUdjQXZyanVjTkFMb0QvQkIr?=
 =?utf-8?B?ZGdDbDJSdTZWR2hrN2JscG43ZWxQb1d4RENNVktQOTNpYS9ndHh6blZNUHFv?=
 =?utf-8?B?N3ZKYXFERVkwbG8zNzdRUTlMQm9XclZ0ZnlwMFo2S3FJZ1J4Qk1DTFV0aG40?=
 =?utf-8?B?Njl6VVc5Sm0xM3dtQTVhdDk3cWpRMEo5Zk5Gc2JTQUJ4aVlKaEZOMHRRMW01?=
 =?utf-8?B?WGIzZzMzZmdtZXlIdWNOSDJ1R3JSK3JjTWdqZWdQMDZlbHdsSkRZWU5hNWw2?=
 =?utf-8?B?eHFJTzJ1RlB3TEhjK0xiVmNGRVNZZ3U1b0FPZ0NYT3FRclBBQVh4N3h6dWU5?=
 =?utf-8?B?TUY3YkdyMFp5NEFWb0dsR0F0dFFKdlhIOVJTRHNpYVdCNnY1dDdaM2lIbVdq?=
 =?utf-8?B?aEcrMHpyZmI2OG45cmFKNExObHBOeWdFVWJzVFZXVk5rOTVFNGx0azgxUmZi?=
 =?utf-8?B?cmJ3SDE2bldQcC85bWM3ZGFsclZuQi9UUjdINlorU0NhRVRZNkMrNnBTcTRp?=
 =?utf-8?B?cm9NWjg5NGZrd05qOWN2dDhpWWJ3amROK2poTHg1YzZVWDRCOFpyb3AyeHo3?=
 =?utf-8?B?d09YMnozMVZRZW1oZk42WkN0VEZwckJkZHhsS2lmVEU0a3BxRUtZelc2U0FK?=
 =?utf-8?B?TjBVY2lkZlRjL0ZHOXVPeTY1RTR4aUh0aHFBdGZGdzJtcEQ1WUR1MXgyL0Ev?=
 =?utf-8?B?aEFsUXhPUzk0N0xGREhrWVlpOG94MG1WK1hBU3JXcUJsR1dSdUhXc1hRK2Q2?=
 =?utf-8?B?MDJqNjQ5aEhEY0g4REo0Vjd2K3RDY3lSc2lNMG9vR0dmenQyakFwcXZwODNw?=
 =?utf-8?B?aEcrMzU0dmlqTUxhZFZMd0NtS2tTRDFLM2dTWnJqQm40aFVjY2NNUG5XbVdB?=
 =?utf-8?B?ZFNManZiclRZVEhtb1JPVlB4N1pGQ0RFeEpTUjBFZ0E0TEN4WTBVSkVnbzNR?=
 =?utf-8?B?QTRPRGw2cmFZVWpKa0hHd2dCLzgyUmlpY2Z3VmJ2R09MdWYwNGdxTWwvM0FI?=
 =?utf-8?B?WVNYVGNhYW5XN200ZlBjOTlDV0dsV2NWdkN2MWNib2wzaUczTUd1MjI1eU1h?=
 =?utf-8?B?WUZGV0JuL1hWVG9yL3FQdStJT01DZHl5QlFOeVNhWG1rdE5mc01nZklaY0ds?=
 =?utf-8?Q?7Gz7hBLT+xEGM/y2jo3iSuhow?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5555fca-8fe5-4a3c-206a-08db7172766f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:41:03.2889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzILRZGls5a4tkU8uYsO/ZQAHIKs+d+ybT19FuY5bpbaVUpISnuR3pvcv3ty45MFAifojkULtyTHplmb65RHFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8718

On 19.06.2023 20:06, Andrew Cooper wrote:
> These aren't used, and are not obvious useful either.
> 
> tools/ does have some logic which works on $(XEN_OS) directly, and some on
> CONFIG_$(XEN_OS) too, but this isn't how we typically refer to things.
> 
> The only user ever of this scheme was introduced in c0fd920e987 (2006) and
> deleted in fa2244104b4 (2010).
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



