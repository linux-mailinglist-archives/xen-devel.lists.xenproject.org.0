Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64653C98CF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 08:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156389.288549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3utz-0007Ku-GX; Thu, 15 Jul 2021 06:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156389.288549; Thu, 15 Jul 2021 06:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3utz-0007J2-DH; Thu, 15 Jul 2021 06:31:19 +0000
Received: by outflank-mailman (input) for mailman id 156389;
 Thu, 15 Jul 2021 06:31:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3utx-0007Iw-NA
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 06:31:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 418e3c9a-e536-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 06:31:16 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-xvAPMPRiOMKB3BwkruXsLw-1; Thu, 15 Jul 2021 08:31:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 06:31:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 06:31:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0254.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 06:31:11 +0000
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
X-Inumbo-ID: 418e3c9a-e536-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626330675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qoixR1h+jjjYyVjXZwT4A4ZYsGCEp9JYS3tWbiwBDyI=;
	b=a6HHTm7tNhO4zubojX6+hQtJPyHwkVjn6eckACKvkH20pWuKcrt2svEQLxdsZ6n2kaaRry
	17rCkcLyhcD+OstXaYqKSiSpKhDggpdaP72+ePa735exSOFQWRIJVfnh4/XeZaFS+P5Hnk
	ZciIObfsulxEXbgillt0R6d/5Ep9IFE=
X-MC-Unique: xvAPMPRiOMKB3BwkruXsLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTBBl/VpbV0cQCL1OZi/YM+83OwQ74rlTSyEmeqoxQqdwdOL+yOzcEDyV4UXd7GdMO/5WjVFLY0JyB5XrgxFVBrfG/dQXTA5K3ooxh1gkecqdzviCiLk/Um6hOtPm81qiY+q8hzuxAg2e+KeD1xOInKPHeP+lJbsfHV8tkU9HIdTiAe6waeESv2/L7lIHbm9k3IEDGmfSc6OOa/w93iBm7PJEOhJ74fbWTSD2pDUzeFeov99/VKYCkNUaw+A5AM5R1z6lREFuG9X4wsGYQavFdTnyoTzclazhbrRNnWmq2vg+i0gP4kefdrr87UOM0c/WkPya6qx/h54JtcAgeBAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoixR1h+jjjYyVjXZwT4A4ZYsGCEp9JYS3tWbiwBDyI=;
 b=Xw6AWwXNrot6JozSd/ByePbisVNIFBFcwMsprTrh3gonF3hLuLhKbRsbTrnPzJNRiUW05wRP5Us0sRFnDVWUOLteXrdRI3yAMP6so7/jrlEg8+zR9i1K/iKv9yiwgYUydx1aMoi/OdD2QwqU73c9Vq14Nrckpdoa5bCMpedZSltAXJOfppuZViTOm1lbzyh5MXtD5NU/Pj41qn2103E5vTBuw3SOqUDzLOgTYbqrEFk3DSubunoB86TDHLOM6RwKu47pAPX+CTRM7aJQMvJyExMcm6euiOpqkjZ4Ht+N8sDf+hg4+lOLDY7N+RkYWTwoBjmOjF9x5th7i0tQEJfnFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/4] arm/traps: remove debugger_trap_fatal() calls
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
 <2de1e8493e08722b5444d1293c5af299c76bf891.1626286772.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <556dbb07-4fe8-54c6-e1a7-330d9a2e8b27@suse.com>
Date: Thu, 15 Jul 2021 08:31:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2de1e8493e08722b5444d1293c5af299c76bf891.1626286772.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0254.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::26)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ea17a30-6a16-427f-c96a-08d9475a2395
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB54703EB27DFC55BB1011D6BFB3129@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2cUGRT/H8IvT8ZBeakE9+iSFu8EJ3heYjEr2aJyZBRc96Sxt+8mbqVvqfsYN0hzwoC0jFAa7/YAWoapsF31K3wY5ttMieDoacjtJkLiWbP0I7dU5rTT8Cu/W/018HzTruxayF0DI5uWcKiivVCEdiqJO/jJ0FDU+3bqT9iC+CPgxi/HUH9bAv3g8Sa5G0eHZis+XgOs3teiQhjiaMrMrSAHXZ6UpseqQ/eeSCPOZf1LqzHjChOT4qXjQkQQ9IGprBKlW9BisZrRbbw0u7LuAVzxViTNx8rdgPMGj0O5u5cq9CdveCNuS7gr4OzAixAws+oXGFxvAts+C+WcvBPsgJvLuPltk2IiwmL5mdKrsQd59gp37MXwHamKkCOVnSRui7dBZM8ta45vGb/Yl94P0WaBr8xTj4/v7WO3hCJJIKfqBqTyZ3SL264Wmyo6aILMZL+00DOqZI9gGsUATvI/jwxOKf9LFV1eK0/AmjtM0PY2s6aX9jzAcMSFynPHY3+iPIo129vta9y3fECkV+yIoX950n9qF37Ols780/nKiiFRgQqg+dDfPvrCbymuE8ldNTilyoWQGQsqQqTOg68BHijyvIGurt38s1hCYo0MeLpOjN03AFnCwzieNLulNdLS1hmWBULiiAKSup66n3HBKxxYIxMJLC5Gww7xUPiD6y/AdkTUpGJDrrbZIXkM6eIiLZVuFohz6ZXRIWJHyljxAXt0lPoWq/Cw1l8N6nojQGLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(346002)(396003)(366004)(376002)(38100700002)(31686004)(4326008)(4744005)(478600001)(26005)(7416002)(36756003)(6486002)(53546011)(5660300002)(2616005)(186003)(16576012)(8936002)(54906003)(66946007)(8676002)(956004)(2906002)(6916009)(316002)(86362001)(66476007)(66556008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3hNWG9RUjM0Yy9kVWJEaVdocm8vYkxGTEIzSUdCcDdiUFJrNGcrQThwNkE4?=
 =?utf-8?B?QU9tanErRm9Uem9zc21ib3BkNGkzb2crREpIdTZwaUE5QjhLZzlTcmh4cTZj?=
 =?utf-8?B?Z25lL0RUUFIvbndWeUtSanBxWTBXNStaTTNoMmtmcC9rc25oMURTZDV1QzZt?=
 =?utf-8?B?TjBrR0FiWXl3YkZHMTVUN3VlTTlqUi9QOHJPd2xXcXdRZWJ3OXE1aFcxVmVp?=
 =?utf-8?B?eEZJTitLN1JBeW1yQjBFU0VRVnlCbSszVFdmRGp1enFQV01DcW5NdWF0VzFJ?=
 =?utf-8?B?RklpQ2tNSW9KVEozeXFRa25rTmc3Yk1TSVF2emxOZ1A1SWpWVTkwcFZUcUsw?=
 =?utf-8?B?UzROV3BEaVNiaXdrQlRjOXkralFGRGh0eng1cEF1QjRlc3N5azVCbVZUSmlF?=
 =?utf-8?B?SUdZZzg1bktRNjJhVnpabVFFOUtIaGhML1I4QTdCd25DeXNHclE1b1NrOW5U?=
 =?utf-8?B?RUo0NzhyK1BUQlVBUGR6cnVWQnREc0V1eWpYckRiMkpIQ2Nnai9SYk8vNS9w?=
 =?utf-8?B?b0NjL3k0OWtNV3EvVEtyREtzSmRrSXZNbjZwZ013T0FDaTQrMTZRSGtjRFVW?=
 =?utf-8?B?cmpzaGRnVzdSVTJJaVJaaVplb0djdGV0eWQxN094SkthV29NbXg5cG9mVWxy?=
 =?utf-8?B?TDduZXI2V3pvbmMreXlmeXhuRUx1b2NURm43Z0ZnWnhxaGRxWGU5emlKd3lr?=
 =?utf-8?B?UForZElmeloxNUJpMUtQcVpYVTdZTTFwM2ZQRkFwcWZhT2QwM3BodnRXZGhS?=
 =?utf-8?B?cHRmZnlsaXVNYkFpTDhnQVlwNFRSMmJFUUhiUUhSb0VWMm5qT2NEWDREWXND?=
 =?utf-8?B?aEc0KzZoeEcyTHQxL052SEpMSzI4dVY2M1ZIazQ1MVJUeFp1R3JhcFVHQTZW?=
 =?utf-8?B?bmthMGorRTNoWW4rN2djNFY5ZXFMNmk1ZVdvcHM0UXdWQ3B6NTdybDJSblV2?=
 =?utf-8?B?YWpTaDZ0RlZCSmlRdVJiVVJtUGd2d1BKZ1p1ZkpvNWJ4bm0vUWVwdXpBWjlG?=
 =?utf-8?B?d1hqUjMzQW82QS9ZZWFHdFR1ZUxXN2dvdWpLYmRvbUNVY1hYaGFxS0lzaS95?=
 =?utf-8?B?WGJUNmkwM2ZQb1pzSmovem1XQzd1VGQ4MkJkSDBGNFlDTS9QNW1EVkRGR01F?=
 =?utf-8?B?QmJETHVYUjF6WEkxaVAxckhDbDhmV3V2TEFkZWE2WE9uZmxLdE1ydUR0azJX?=
 =?utf-8?B?ZWg1YzZhZEFNV0NmUkRlSncvaTl4SFdqQ0UrNXA3TWpMZ1lVLzIwVGdrRnBK?=
 =?utf-8?B?ZkJhd0tVMEtScEtLUC9sR29DWVRudHFjaXNDUk9IZExpUnlsVzJHRzF3Wi9U?=
 =?utf-8?B?OURnSUxxSEZrNlVRSFBjN1VpM2xIQnE0UDV5L29VTXJiaENQVzVkTGQrb2Zj?=
 =?utf-8?B?M0FjN3lIS2FWQzczUjA0YzlUSG5jNllrVGQ2UnFyYWtDYXRLVFJZa0VRbkNF?=
 =?utf-8?B?NTRUWXJiYjFoSDJ3Wkd2dzZnNCtTMDBvUXFwblUwNDNlQTA0Tmtlek45ZFF0?=
 =?utf-8?B?clNNMkM2RjZLVTh1eXNHdTJIaVJoMGhaYUZGN0Q1cnozay9lQytBRmdEcXlS?=
 =?utf-8?B?VUMzWmlUQ3gzcURzd0o0Zm1Ed3F3ZGdIWm5GbHdqeVhScjI4UFQxNUV6R2ZZ?=
 =?utf-8?B?cjVQdVZLR0xXRGpLNk1wNlMzZXJMeHNXV0t5L1NMa3htZlNDQ2JNNk5TYXJn?=
 =?utf-8?B?RzlZdGFSVUxMb1c5WjVUOUtsbFI0YzRVaWlTK1BpTWV5MmcxazdjZkVnL0pq?=
 =?utf-8?Q?DJXybXzSpTMfaShjsv3b62r+MAWmpd3yFp02qo3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea17a30-6a16-427f-c96a-08d9475a2395
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:31:12.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCIe4GI8sHo/MH1StA6Op5PphR26vP5vxIFj2f4+8UKi/3/8gr0y3qq0X3XNXGsbNZjIPl/dvD124SEzZIg23g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 14.07.2021 22:37, Bobby Eshleman wrote:
> ARM doesn't actually use debugger_trap_* anything, and is stubbed out.
> 
> Simply remove the calls. This also renders TRAP_invalid_op unused in
> any common code, so remove that definition too.

This part of the description is now stale; I guess if no other need
arises to resubmit the committer could take care of removing this.

Jan


