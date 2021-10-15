Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0F42F08C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210456.367333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMDC-0005jV-1i; Fri, 15 Oct 2021 12:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210456.367333; Fri, 15 Oct 2021 12:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMDB-0005gB-U9; Fri, 15 Oct 2021 12:21:21 +0000
Received: by outflank-mailman (input) for mailman id 210456;
 Fri, 15 Oct 2021 12:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbMDA-0005g5-B7
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:21:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66564350-2db2-11ec-8235-12813bfff9fa;
 Fri, 15 Oct 2021 12:21:19 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-XW6KcitBPvC5VAsXFWK4Mw-2; Fri, 15 Oct 2021 14:21:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 15 Oct
 2021 12:21:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 12:21:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0011.eurprd06.prod.outlook.com (2603:10a6:203:a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 12:21:13 +0000
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
X-Inumbo-ID: 66564350-2db2-11ec-8235-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634300478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFI1l6HpFJqS7tyEPeOP1lybrbAvgDqn8oz4gNy3HqQ=;
	b=OOLFJySmIkz0NXbrr//r0cChmAohwqb4C0jfR8370Kr2Dr3lewYBpt4Y+M9KjpKg2brKaj
	sI4/e73auxSyyf7sjB0VVxMptWFt6dzvUNn1ilwD1sspWxe04dv7mgYjGPh61lsJpV875q
	ZBh/TbQNab+/5cTYbSW8UVDCi8ydLF8=
X-MC-Unique: XW6KcitBPvC5VAsXFWK4Mw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esILonrKT8iSBvigaB67gU4Q08kZzpIlsGb0qc+tVY0TeCW7sR2kcFQN3NgBD0hk/dd7KRLJ7oQ6PVzlwWrhaDRjJ68Fgh6TaiVdV32CYD2Xn7pTpqWeGoYZFujlY1MPgpzmHzgPo4LPZMToZypbRBmWvesBIlI1B9ibF1fu7id8oyC5JR2xzwlurgjtr48kqFMyNu/yzoo2rFvcm0FzXrdBi7QDOh3On4xJZGvofs80mfE5Y0YlBcpLkPPSMji1G+zWrxppmKzZwb3v67xcEizAgGm1V/A5l7/gycQcyzcoyRDjFF/T1FdFtvBiU/0XIxcP1pkBuvzGn0sQvFN/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFI1l6HpFJqS7tyEPeOP1lybrbAvgDqn8oz4gNy3HqQ=;
 b=U0eTkN7xIV7Cb289SinWqMHAcH2E5egm0IyJbr/j1+y3TpnvaNJSGBU3Se9fjO90FIbi7F7LIOj5rC98s+KnrkHr+AwIZBU1okog09oymKx8UuuB22pP7vJV1MSsAhX7DXQmFTyCxQebG8FgFl01poR5haKqye4h/JTLhipae/d8oOM1544Fa3CG0qB6DHwCe4SBFOG81yCjtzdn0lOtXWBg5M2tx+zqJvslWoLDXIdedEOTWKMM6dPb270eoxdYRzogA258/ia/hH/w4mhN4KzCSMoC/GfYVqZ7pDOxFALvLmO9JuzWZ66tQP0TAIHsUXUeUDyfmJy74EtDiA57Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit
 test
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211015121409.24434-1-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f65bee5-f8cc-cbb2-9731-5367f4fc08d4@suse.com>
Date: Fri, 15 Oct 2021 14:21:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015121409.24434-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0011.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f099b22-caac-4286-7b8f-08d98fd6478c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384B356AD504858A5451D48B3B99@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zpM5lGyv/M3NMs6ArbdZ5GQmIEKwN2gIpGPr91/XZyo4hhwFXYa63eLJv2iniFbQRH8ZwKE06+bB84bzSLV/n+5ZVW1ThqGLAobLFw13M8G1ZnzF5tCLyI2dPy6AyCW/sFMoPGfBOrX8Ju7B04BLBuHloNuO7CX/YXVQby3drIUkW/6vKU+8+U7K4+U7IfFOZAbfGwIhFvT7f7HE/0eccuYXwqSKE3+Zo8H1QlWn/PFyK04C+28udhANXBr+z5lZmB6Ms3eXc3dRUhlWC1L2pOSyvWVX65YDCA9p0qUoB6ZRRRHHhb7siFPgh/Bd48wNx2Jyrb2LNIlKKW7sJVlTDZ36ZaNXymCY/8KQGOE/UBrMw90DOgWPCiM+zEfvQLrj/SdBrMcqsvvlwy293Wg+07TieiYg7rtKeQwbjQarvXPHvz2xsn9HevCdNXgPlhvOBMtVVMtY6z9F1fHA1UxbTomigXMJcAV2/zRg48pTHh08IFDX32pKWVNUHcUIg3AgRMIUaSS9bLDKKx0/UWcBhk4Wrz9yzo5VcLLCKN+PTaQcaH6JIv1FxR5k/Xik9hHBy2LKIdD2RX9qegSZXoybUt23UZ71scgIiqB54i7lx2O6acgUi8c2dgiY2u46MV66BirKtPA1BxGceoErHhSX15DSbwPVVzJcqJZvMtmszcVXjoslD+sBvxcgtY3yaZhdahAEkSyAGe+V8X9xKzFCoYR5lgO77zLako09S9+4eAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(31696002)(83380400001)(956004)(4326008)(16576012)(2616005)(316002)(54906003)(8936002)(6486002)(66946007)(36756003)(38100700002)(86362001)(508600001)(66556008)(66476007)(2906002)(26005)(53546011)(31686004)(8676002)(4744005)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVTRFJvUXZ3YjUwb2FSRXBWQUN1azlsOG5NS1NRaDJZMWhyd3I2VVlQQjAy?=
 =?utf-8?B?eCtab0o2LzgyZTVIRHN4b3BtbmdQOGpDN28wcFJrR3NqMVVFZ0xjeUtFSUVl?=
 =?utf-8?B?M3lldUlCTzZRdWNkUFdxUzUwdm9OSTc0aDQ3aDBwa3B2Y1ZJbVV4eitNcFNH?=
 =?utf-8?B?L3hTQjFib0RxK2w0VkVCVWpHMWpnc1o5SHk5RmF1NllyYXFCdGYvZ1o3a3hq?=
 =?utf-8?B?UTYxTkFpbjNNNHpuL2wyWVY0bGk5VjhmVDZHODhwVmF2YUpZcjltcjNLRk1Q?=
 =?utf-8?B?amIyK1NaUEIzeDFZRTd3ZDk4YUdxZDNQN00raVRhZFl3TlJOODN6cS9YcXlX?=
 =?utf-8?B?eWc1Ykg4Sk11bGRnejJBanRvQUVmQm9OWlZHTXpRNHk3ZHBZelFCWk93c0lO?=
 =?utf-8?B?MDR5U0x0dUxadDMxcEF6bTRLWDljeWpQZjd3U0dYTHlNRWN3MmtsSGVXZE55?=
 =?utf-8?B?eStKUVBleGNXbER6djNWRDUzVlF3Q1FlVjIwSkM3SmZDMUF6NFJzL1ZNODJC?=
 =?utf-8?B?VkhOcURQNjdoYVhXc3VWMVJVdlJCRFF3dmtHOE9LaXdTWkNWcndSUnlvOTln?=
 =?utf-8?B?ajExWExhbkNRUWhySUZXOGU2dzlEb0lrMGFlMyt4YlhOV0hibDF3eEZmVUMx?=
 =?utf-8?B?OHI1SGFXbC9kbVlpQkl3Ym1OVkRJT2lIakZ4Z3VKb3lxWitqZ25CbWR3b01O?=
 =?utf-8?B?QXUyM0JnWTFPdUFIUU9XWEs3RElvM0NSdlVrajI3eWtqQWxxcXlFSW8vNWd4?=
 =?utf-8?B?RXlPMzdqbTFkVm1mOUIxZjM5UVo0aU1FN09BcnJScngremYwZXRraUNMamZy?=
 =?utf-8?B?dGcrVVFjc04xTWdmZmlhUU5DWDZjclE3dWtXbkFYemFDc21OTE8zUmdiOVVm?=
 =?utf-8?B?TmFwL1RoQlFEczNEaXRLS1JsaVRjK2V1eG81Um9vTnErOWxKQnhDYTN4M05H?=
 =?utf-8?B?VlkzWlFsNEpNSFZGLzRvUnZ4RHlMOEczb3JZNm50dXUvZTlZVUJWNmZHTVRQ?=
 =?utf-8?B?YnY2VEppY1N3RW9QOVFST0pGakRxNSsyL0Z2aG5wWWNVYUQwSmNQQkZYQjRG?=
 =?utf-8?B?TzdIQ2V4OXo4bkorQmp1U0xqWm0yRHY2ZUhIdUpTM2ZINU05bTc0M1Q3TTl0?=
 =?utf-8?B?dG42T3R2QytIY2ZIV2Z1allHTG1LS1pqYjRQdVM1bTlGL0tzYkVWRCtETWwr?=
 =?utf-8?B?ejhXOVNFZjRsclN1ajlMS2pXWEorKzBBUC9XSTNiWGc1K0ZVZWp3Um56a2ht?=
 =?utf-8?B?S1h3NkVJUHZNQTI1MzVYVlBUMFdwc3lydmFpWEx1Qkl1NEZiYmtFRkdWR2pr?=
 =?utf-8?B?UVlrMDVnTXVoNmdQOExNVTA5SWZhY29kSnJxUEdITTRxUnkxWHh3SVdJUVhl?=
 =?utf-8?B?WXRWUkJ3N3VuaXd1VnlQcjRlTm9IcnBXOExsMU5wTmlFaGFEeWMrT1pZaHFH?=
 =?utf-8?B?b3RXNFprRXhBMzV2L09tK3dualRkeEhCTDFRODJOTTB4cEhYNGxFSVVNRUx6?=
 =?utf-8?B?aW5UcjhrUisya0JnRm5xaDVWZXk0RnVCbkNHd0w0L2VETTQybldTTmlPT3h5?=
 =?utf-8?B?a3QrNzIzLzk4M3pGMTMxa0dXL0RVMGNEZkNVT0haNGtyTWxIRkZzTmk4TDhj?=
 =?utf-8?B?dER1RmY5T2hFTDM2Mld1Tnp0THhDelVzeHZwb0R6UVFtTHVoOWg5d3ExRlYy?=
 =?utf-8?B?Sk1ab0RLSDJWTVB6cHYvTCtuanhVL3RBZVdiK2lVVHQwMUZGTk10ZDd1aElT?=
 =?utf-8?Q?rM+2Xn0YtV2L2z5b0AvKdVBaqCvGHv4ILuPr0ot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f099b22-caac-4286-7b8f-08d98fd6478c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:21:13.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywwhGwKhM8MM7P58o4M9fATmEHwleUfyvZhX8JekpdXCvYEOt7hdkSOJyQfqAaT3+rXYElzyrqNOjRGSd1T+Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 15.10.2021 14:14, Kevin Stefanov wrote:
> --- a/tools/tests/xenstore/test-xenstore.c
> +++ b/tools/tests/xenstore/test-xenstore.c
> @@ -110,8 +110,17 @@ static int call_test(struct test *tst, int iters, bool no_clock)
>              break;
>      }
>  
> +    /* Make E2BIG non-fatal to the test */
>      if ( ret )
> -        printf("%-10s: failed (ret = %d, stage %s)\n", tst->name, ret, stage);
> +    {
> +	if ( ret == E2BIG )

Just fyi that it looks like a hard tab has slipped in here.

Jan


