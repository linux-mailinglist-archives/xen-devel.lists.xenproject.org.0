Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864185113B2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314553.532659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdFx-0000j8-T6; Wed, 27 Apr 2022 08:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314553.532659; Wed, 27 Apr 2022 08:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njdFx-0000h4-Px; Wed, 27 Apr 2022 08:42:41 +0000
Received: by outflank-mailman (input) for mailman id 314553;
 Wed, 27 Apr 2022 08:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njdFv-0000gv-OG
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:42:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdf159e7-c605-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:42:38 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-PYhgKIAyPbiTLHHxK0L5Ww-1; Wed, 27 Apr 2022 10:42:32 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB5516.eurprd04.prod.outlook.com (2603:10a6:10:80::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 08:42:31 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:42:31 +0000
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
X-Inumbo-ID: fdf159e7-c605-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651048957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wd/lS6DAzvGxXNKYuj+6202qrNiR9inebJj7nAq0WMg=;
	b=bBzdHNhkTD2tlwYy5pNrixSfPTTIyhrfas9VllOzjvxgKkJBJcWed1YZMIRJnnBKzU0WBc
	JY0Oyddlb94myBuZZ3JbiXH+JrGqpX558oy/fIjinqQ1QryMyA2WlW7CWTrl7xW/BXfYBd
	rpKmUC4zFHXKG3AcQobFpTihi2p1Co0=
X-MC-Unique: PYhgKIAyPbiTLHHxK0L5Ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXHqLgEHOt0rnfe1GhPxF16ciy/sWVg4in7lCd945NrmkZ7xsxU8TO2tTgXPCergBnnnHPS8XB9aePhCDYRPJXdDGQfas+ocpcajpFx7K4cNUdGx7jYTsdXylyosZc9AIPYM6iflMrkYtQtjaqYUT3GlqEhlMTxdKfGI/1j0LViPAsdFOGjqRZN3uASDcjlPCAv9ZREVJvPqBHY8V3RKEV5nD0g/s+YH8uO214zOqxVw3lftsLFACoXVz+3H6IkXDWt3sa4ufO7QXTjXC+CmFAvBf/Xx83EFpw2iRHotCZeE7mp/Bmgmp5b2gV61XfwgIMT+BKqrOtOySxnRjEjlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd/lS6DAzvGxXNKYuj+6202qrNiR9inebJj7nAq0WMg=;
 b=gdXl8INe217FLIqvlqIOVdTYIyAMVV/2uQFw7oTEDmgZ4y0XBptfJs2q8eMzHhW3zoqoQGZ3L+ZGlNKMc/CFuV47IixHDGKRPri+tPaYDpbA4+FAaRLCfNlzB2wMORf8ZB3Xw4/mQNEd5uT7VkZZ4pdM2zBhUL8jmaEZUl28nnurwq4EsCeiNKnyI5mymUv2bg5rq0h5trvaSqU7ereGJR3vN129sSRAsPKFWT0POmAU4AWGxQZhyCruufo++ftamR/T1I2d4M/MhGt9LqjX962+BsFul7aaylnPwTTsJHecEYG6Mu1rDGGesp+qTch+zcV5ho614gPlHjjtUiYPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0644ecd8-51cc-897a-5555-62d4c9ee9461@suse.com>
Date: Wed, 27 Apr 2022 10:42:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <Yl7WHv6+M+eJwQep@itl-email> <Yl7X3mAJhR5ENSpl@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yl7X3mAJhR5ENSpl@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0307.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fd6251c-7ae0-49ee-d0b4-08da2829ddfe
X-MS-TrafficTypeDiagnostic: DB7PR04MB5516:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5516F27DBDDE1E84574C684FB3FA9@DB7PR04MB5516.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oT9kvhrhbU0iu48A5RNUCv4TmQJs9ELNVr/w/0oWab+rRFZaThpqBhvZpFH58UJz9UAb76U0S4aHcUUjBuhN7qyCg3osvE8ECPkKJ6bEa+9aBku75yWWVI8Xdb7CyBi6GZeFtgIUTLUsfLRnHlUjUnoK3NtX14BzmwMRBg/XpU/7gD0WGoJmj7kkh0IUMFM1MX5kq6S+ZQlZChTdJ4cmQh0oE5EgE/A3P2/ZIKHd9ZiEZt75OAXgtHC32OsR41VG/XxIJjaGTV3YtnIAV8rofz4kJQpQIQ7+KaqNsCEs3q1CabeLtRlpIYqyDNCdb7VpE3cph5PFLQg+bLCZKXA9ZDQXGovsGWJgZnoURfUqXPC3ozmE1pV+d2We27Rn3HnC0LN+/j3oMRES3aKLCCXVree1mItsEAsfqpWdY1tXpp4SmdKvlgm2KD/R6ec+0fpm2G9ii45NIXpT1Pr9ZbTvQl5P+quwZAlM709wRZF3RYB09g1cpT/7WNQvVGYeN6Sq0u1WtYm9i5qBiXalQPbCYg1nSPddnb0um4xUG/3gjuJFNNCj2GVOyRRL+Gvs6uPRzyPHm/P1jYM3iDQKU7jB9dGI2mfnOXi1lDXocvBsKudTugvWQCG8HpLTL/+uAEYgVIvCe+jgEf4lyu2yywq1n8/cypdLOAtWI7wKtLJFarXpjCgRUpY1zPGE+RPfNSOgNaRQTng+cdbHCnGP1wJ+cmA1DO98H/PoA8zxaz6+w28NQ56zj7x+j5r3I8MeyMcU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8676002)(2616005)(5660300002)(508600001)(2906002)(8936002)(316002)(31686004)(6916009)(54906003)(66946007)(66556008)(66476007)(38100700002)(36756003)(4744005)(4326008)(31696002)(53546011)(186003)(26005)(6486002)(6666004)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTkwWGZDaDFRWlpIU3B1NVA5QVhVMTduVXlvMGlpOFZYbUtKVW9RTzRndWZZ?=
 =?utf-8?B?aERPUWFTSCtMeG5jeFlOQnZzTkdpc1VOZ3V6KzVBVlN6MmpRbDJuUFFZTWN3?=
 =?utf-8?B?ZnJlbHI3SDBxcFczSlEzZytkeVBiOGVBZmlGYTFkZ3cvMXM4QVdHbTBISGpm?=
 =?utf-8?B?YXNGTTBmZ3JZdGJqdGs0anJqMG1paWpiWlgySVFCYW94ZU1tT3NPRld6RGlE?=
 =?utf-8?B?TDZOVWw3N2JRWmJCSnpOdmVJNStyWVpTdFBYeUZhbEhOSzhHYUMweXNkNUxj?=
 =?utf-8?B?alVRbFhVQUNYVFQvOEN6MFhVSllSR3lRMUoxazN5OE9CbnhXWUpOb0x0T01p?=
 =?utf-8?B?Z2VuL1BsLzN1QWZ4OHplUEZMRjlWdU5qUjJTRjZLTEtPZllkby9VZitjLzIx?=
 =?utf-8?B?a2FrVFJ6OFphbTFpa1VOeEFVTFRJRVFEY1pTaFBlZkhuVHFka2Y1cGVIS1Iy?=
 =?utf-8?B?NnpMQTlIZTZ4RXdhWlBJNm5XU3lrcmt5SSsyRnV4V3lmUDlZS1oycjQ1RlNO?=
 =?utf-8?B?M2V2Q1dKdWxuWTdGL1BKS0QySlRReE1Gb2ZDUkpab1Qvb0k1bnYxMzgzazRj?=
 =?utf-8?B?UlBjdElPU2ZrajVTY25JK0RrNzFYVlE0Rkx6aXdIMTJvL1NWZHRKY3l3QUJU?=
 =?utf-8?B?YXhjUFNyZG9YQ3l3MWFGRXJ4dGU5QUxWczYxUGFRWGFUdFRaNDQ4TW5zV2VP?=
 =?utf-8?B?VkFVVWNKY0dOTnk5ejI4QjdPek4rK1hibTk4MU5GOTROV2xST0ErN0VMaHFz?=
 =?utf-8?B?MEdtQmFHZ1NZSjVTM0wrcTFsOXFkb2NlMWJ1clVLd042b2dXOWNWMWtIeG4v?=
 =?utf-8?B?Q1Z6aGY1c3FhVjVsOTJOcGNPR29JSjRJKzlHK3ZMODRFeERuUzJqQlBDV2lQ?=
 =?utf-8?B?dHlHd3pqZGNMS1dIazBZanYzOE1CNm8vUGhlT2w2OHVCUk9IMy95S0cxTklr?=
 =?utf-8?B?Qk1IVEdPeHUrT203clRJb0dhcVNhL0NGMWFUWEpnUDVwZXlaNXFrbjB5M2pZ?=
 =?utf-8?B?VWVhSkh3dVFtYnFZMVdiY0xsYytTWW1UNXh0Y2llek1qV3Z6VVJLWm9GTFQ4?=
 =?utf-8?B?K29RTzEyeU91RTUyQXgwWTFCamR6QjVrcXhKT0srd3Rqb0puM1BxY3VhOHdl?=
 =?utf-8?B?dnVKNy9JaDZQQ1ArTWdZVEdBeGRIMWlFcTY2RnArTUZYS1FYOENULzA2d1pz?=
 =?utf-8?B?OXk0NnRDY05MdmxXSk5QNXc0ZTlKSFNRcitaNld5RitueUtteHpDaVk5dDdW?=
 =?utf-8?B?Ty9xc245S1EzRUpmWW9KUWxUU0xoaDFiOVJTQmlYaWdlNGdiY0IyNC83Q1Nr?=
 =?utf-8?B?UVZFc1hOTGVjelo1V0ZPczRjdmpvUjVRaGFJUHhpMlpKeXJpWXkvSzVXU3M3?=
 =?utf-8?B?WGxFM0JYc2NWMUZINlE0anVzelVHK1RxdFNoQmFTRHo4WkpuY1BaSldtc0F6?=
 =?utf-8?B?QkxnMzR1M0tEdFBTaTcyUkQrd1dMdTB2RENMc2J5T29VQWpnVkxGRWdJemti?=
 =?utf-8?B?UmFZdHZubE1rOTRWL0VIU0VZN1B0Mzg5Z3RpbEE2dTN3QU1Nc3MrQ1liWWFt?=
 =?utf-8?B?QnU1cUp4dTBVV3grN0ZURXhRS2JaU255UXJZUHUwRzJRVDhUUGtwajZaUXk3?=
 =?utf-8?B?eTBGTTlVRExxd3pWV2Z3TDdsVHkyQVBTVjd3QStNcnZySURZR216djUzOVB4?=
 =?utf-8?B?WkJTNG1xQ2xUOXJjUFZjKzlnRzBsQ3ZTVnlJMjc2ejF6WmhJZlh3bGQrcmJT?=
 =?utf-8?B?eTBBMFQzekpUeDN0U0tuemN5bVp3dnFPQWY1YVFCWitueDFpb0tmdkNUU1Nk?=
 =?utf-8?B?dkVoYm5WR2NGc1pDMEVtN1JEdkR3eHdkbTRWcnphTXBoZzdDRkI1VHJPL0ZX?=
 =?utf-8?B?MUtlRG1hS3ZBa0d5ZTY2cUFaUlJ5RTMybVVtRzJ3RmEvRVltOFZhQnBpb1o3?=
 =?utf-8?B?ZU9CQlJzRTBCcWtEd1RkZWpyOW01azNGMXR6N3FHb0Q1ZzZndVFvM3hjZDVJ?=
 =?utf-8?B?R3AxZ2lQVzBNclFBek56REFIck5KZHp6K09Jek1lMVFCWS92bjlzWE1pM1BG?=
 =?utf-8?B?KzlMeWJiOUhmS2IwSzYwSno0c0d4dmRQT1hHTkdSajYzbkw4VWFLZTV2dVVt?=
 =?utf-8?B?QXo4d1dNVU5KOG5ScDZrK1d1V3QxVFFWQWNTaUp0QjNBSWh4enVJVzZhQ3U5?=
 =?utf-8?B?WkNMUFpmSHJvRGxjdWZvelc4NEpkWk5pUlVCWElyeHRRUmd6YWVZeUxUVGVH?=
 =?utf-8?B?NTZ2ZThXaFR4RzJIVy9STTFkUjllT2VkYVJOSnJXVy80Ri9wUFNEQTY4SnNr?=
 =?utf-8?B?cGtncHZSWVZvbjd5b1hLRDlUdjRRV3VvVXlhbWs0S0NpOWdYTnJVQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd6251c-7ae0-49ee-d0b4-08da2829ddfe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:42:31.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4xZJy1IvrjZpqI/Ns9uNySfNNBGBnewkQuHz8jzb6SKhbSCc6WLDWOs2FqWI+PuiVIBh58AFhh9OA5lrsjo0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5516

On 19.04.2022 17:40, Demi Marie Obenour wrote:
> @@ -1056,19 +1091,19 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size = 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif
>  
>      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
>                           &efi_mdesc_size, &mdesc_ver);
> -    info_size += 8 * efi_mdesc_size;
> +    info_size += 8 * (efi_mdesc_size + 1);
>      efi_memmap = efi_arch_allocate_mmap_buffer(info_size);
>      if ( !efi_memmap )
>          blexit(L"Unable to allocate memory for EFI memory map");
>  
>      for ( retry = false; ; retry = true )
>      {
> +        esrt_desc = (const EFI_MEMORY_DESCRIPTOR *)EFI_INVALID_TABLE_ADDR;

Sorry, one more question here: Why is NULL not good enough?

Jan


