Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA744D1227
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286606.486184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV9Y-00021n-Ow; Tue, 08 Mar 2022 08:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286606.486184; Tue, 08 Mar 2022 08:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV9Y-0001z6-Ls; Tue, 08 Mar 2022 08:25:08 +0000
Received: by outflank-mailman (input) for mailman id 286606;
 Tue, 08 Mar 2022 08:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRV9W-0001yt-Q5
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:25:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f2caba-9eb9-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:25:05 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-UsWH0zvXOoSZN1eM8hLrVg-1; Tue, 08 Mar 2022 09:25:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7126.eurprd04.prod.outlook.com (2603:10a6:20b:117::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 08:25:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:25:02 +0000
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
X-Inumbo-ID: 41f2caba-9eb9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646727905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpwuUxvuVryOj+z07IltX4NawtC1HTPFBO6aoxcYoW8=;
	b=WutBGY+mA57f8TavYnUq7JvhnG2NuWytv9niNClYngfV671wV/3LnVzAM/QkhAOl2dbhJo
	mqqHBakYK5/KP434vEgpW/0QBRXNReIHSPtpQ6tFBoq5wL1YjSmr8iwbsdJgkGxzzkJ93c
	5osx49R5pkBkG4TLIjadUkjGkFMjiX4=
X-MC-Unique: UsWH0zvXOoSZN1eM8hLrVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9Pn4D7zB0mkBTah0+rbZMQ8IGL7Yxizp4WxOh5YMQs/L2igdToRISICWoHRDhNOqCUvfYO3rOzV2NfImC607F8UetNH+iB+T0aTTPzJXnmo4Fk0OJNIC5Dl09L00JI8agibwG0BxZZgmnawt2QNSUNL4+Afj8kDqM5Vsm7NobfT729RGmcjbpp7kJ7Bx9AmmW0qFC1JGAPW5MzpS3fg8Rn2jILNQAWS1t6yOc9jPxmzb4FoRcI/l3VhMlvFtLYRMowDJmYG3+upo9Z2iDCn+giBVQSVOr86G+upuowRGOh5VbtJLzDCBuo0wDYj5ZUQWE3wC4g8lKX7nAMMyFAc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpwuUxvuVryOj+z07IltX4NawtC1HTPFBO6aoxcYoW8=;
 b=Ww//WJccPBInk0CDVXwuDS6BxX9lDJDcmRYSLlPlLhi+vH3BLhPr3K22Cm8v3vzpIPG/WMYytCz70z9qYYC51vB39kvVV/rqcAPVUa5Ft3P6lm3dNCiQiTNpStX7z3MTwagLo5/+JCryegDjlCOO2ER83EryTGrJQMk/cIgUuJAff62cFO4lEayMwv6cviid6u6smdohd0M0aHUk6fXYb51uEUHVAdG4lOIYKtaTJvF3P92XpBR/yDiOGOxSy951ARhN4Sj+YzBVGEt02ed3JtzE+sVgpCNZ2nutf6w0bBI7nqf0TZjmd8udh3nfTFzc7vpliiB20AQXQdUBkmmYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5244b6a-4d55-e80d-e5f3-cc8da3484e2f@suse.com>
Date: Tue, 8 Mar 2022 09:25:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/kexec: Use noreturn attributes, and drop unreachable
 code
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307210210.4261-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307210210.4261-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0314.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c77253aa-69c7-4057-723b-08da00dd2448
X-MS-TrafficTypeDiagnostic: AM7PR04MB7126:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB71265AD2A9179A03740CF882B3099@AM7PR04MB7126.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ek7GeQR0+CQssh09lwDQc3yJVH/VKnnUG35lhOL2cL5H/ggY+/M6mOHysO/m703McID1+TY7FvSzcFP1w07l/hi9dLECgc5/4RNWNaWFcjefZmbmhAD18h5O3PDAuwB4ddFkv3QmW4KunHSPtYbx5WgdgwARciTsU6elm8N6gOYSI5eLkxi027LsJRXbLtTjuV7xqnVw8BuK03aXRHkF+SHu0lX9we/dwQxhq8VFGhMjftb0v5qqHxQXAqfp2WWr2fU2Oed2Gg6YD9F0sej+uXY63/MqZhTNRtvPln4o250YaBcSW4SlncxtgJZN/Ej9Vk9OLlI5w+nYi/wZaF5lER6JUmT0UJhRTKZpR/7m2PxdKRn7G3CUt1kJI+kRBZZ8xwKnha1qYBdm+eYXH39U8kBKp/oxDlQaNsDFPkpIQx3ImvgMYjszyPkPTWoeeX9GfV5VBjbAcNpyIqHcXyPc443osIk+SaQVRwXIgrenigsTRPACoSV4Y0am027gTYpBsaPB4uPdZtbwvuE5idNhlXf0lcnWwskgeK1Sg1pwwmnqYFs2diicEyOzviOAFh1or2puUVqH2grml9mYLxg4iiM6qUlFvwPq8yCWMBAlLBY1wJAOqebxenPo2W3oUpaZxmzJ8ks7Gacwif4S8WXIr9l7GPt4MxyKnARucmc8jDnxGyXeThNEdUDyCyZgj/SXZViJV1vYNANyRktyIYv4WlO/U9Ryo2iIPEL9IJT/axvPU9YIGhvsSHOZ+5dxo+kc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(53546011)(2616005)(4326008)(38100700002)(86362001)(31686004)(83380400001)(6486002)(36756003)(31696002)(6916009)(54906003)(2906002)(4744005)(66476007)(66556008)(8936002)(66946007)(8676002)(6512007)(316002)(5660300002)(26005)(508600001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjFwYTErTmJzbUhldEtoZk1RVEU2NHBYajVNcWltQXpLS3F0ZzlNTFlvZ21P?=
 =?utf-8?B?OFRGUnpGbG92dXZuQjRJQ0lFSXEvZmhLM2FxcWpTQlJRRGZwdmhpdDlOSDVs?=
 =?utf-8?B?Q2IwTWxaNTcvZXk1bVJkajZ1TDdaRE5qc1Q5anNYT2QwazVRRzlaamlZNEZV?=
 =?utf-8?B?S3FBblpEODM2THhpd3UyNnZBbCt3enptbkdIeEtLUWZzRitqT0JFR1RhS242?=
 =?utf-8?B?NWMwWWV4VkY0MkhqNzVGTWhSTi95dGFUVjZiL2tkbkR4blNqWWRUNWFpbHBo?=
 =?utf-8?B?QXZ3bzU3aG5reUpkWFlOamwxR20vY3RVek5LdUE0WHRWQ3Z0UTg2NjBmckpK?=
 =?utf-8?B?cTRHN2RvOHVlWUlsOGErTFIxc05FRUdjeU5LTFlIRXdTcEcwN2VMUlFaSGdL?=
 =?utf-8?B?VHNlcm9tMTBZSGxEaW9VdkVqWW9xcmEzQ2tHVjhrYXJ0UjN6Q3F6NlEyTURK?=
 =?utf-8?B?YXdiVWtQeXl2N3BFV3BuS280VTk5YU9kSVhqaUpsQlVST3dKMzJRZkVnN3Iz?=
 =?utf-8?B?Y2ordVhCeElUcVZGRkFyVFg3YzN2MEpjUFp5RXU4cVdwaE1IRGJ0UDRsaGtK?=
 =?utf-8?B?SitTS1J5ZHZUUSs3Rnd0UHAzRWd0LzZNNEdaQXVqZlNJUmVZbG1zUkUvV1dr?=
 =?utf-8?B?bVRPRU1NZk9PaThqQ0dYRlJ0SEd0L3R1a0xQVGVRK0RYRlZoNFFWcWtxQUp5?=
 =?utf-8?B?L1ZTeXkwb3FvbVAydVo4YTdQSjRsQ2dmakZYM0p4eHRGUS9ZZEZOL2dFZUxJ?=
 =?utf-8?B?ZkliU24wL1lEUHhwMW9xL2NlTFphMkQvUUlrM05pRDE4ZXdJLzQ3em1pUzR2?=
 =?utf-8?B?UUx4TmhTdWx5dmpRbDlmeTVtUVZ4VmN6VmxrNDQ5QjNhcWVIYnlOYlZ3a3Ey?=
 =?utf-8?B?N1lYUTQ5cldiWXpBMUdrRU1rWkxxRDcxTktmNlU0MXdJR2tMdU9QTTJNOUxr?=
 =?utf-8?B?UmtMY2FWSXZRZW9IK0Y3VVBlVEQ3Nk5YS21ERFdIdHN5aUpBMGRuSS9VNVNi?=
 =?utf-8?B?TGJ1RTBRNUh0ZnZXMjFURXk2ZVJKYkIveDlvSk9pbmZ0TUcxU1E0NExERVV4?=
 =?utf-8?B?a0dKa0RveFZNeXYwVkFtN0FsV3JKQkpYbmNxMU1UcTVqL0dFbm4rNG85aWdM?=
 =?utf-8?B?U3owc2NMQSswSEROUWNtclkybUVPNEsxM0lweWg2bHpIa0hudFBESUhsU1Bv?=
 =?utf-8?B?SktmTmdnUWM2SlByTTQwNTk0VWVpRlE0OUs5b2ZGbjNxamRZeHJISDNUcFEz?=
 =?utf-8?B?WjZCY2k2VlY4ZDZ3VHhHQ2xDYWtVY01pbkFtRkFubTBtRjBNMjgvRlVma3Vk?=
 =?utf-8?B?a3QxVXlFSFAxa2pXeTV0MXNJRHFmUGxjY3lORFUxdHBNaER5dzNEWXhCQTJu?=
 =?utf-8?B?VTZkajlkbmhxQ2FhZmlLSzZQU3FPLzdBTGxKdGRNUzJVT05qUHg4V1VmdGIy?=
 =?utf-8?B?RWtNMy82OHZaRWkxb242RThuN1poQklnanpuUnQ3N3NyYmZ1TlhwbmRJcHhL?=
 =?utf-8?B?UisrNTN1cFJ1ejBiZm8yaVJMZXpCcVFFSlZJRHNIRFQ5Lzg2ME5MOHN0eklV?=
 =?utf-8?B?V0s3bXNwMWR0YU9xUnpueUpQdFp4ZFpzckl2M1MxWXFBaXpXWmRqYWRzNkwr?=
 =?utf-8?B?TklHNWR1Y1Q3RWtKcC9wa0pPMVdnMytnQ3ZFMWVlakVuL1dIbEdyNnZnckdH?=
 =?utf-8?B?VERmMzRzU2xQb1ZXeCtvbkpCT1RHY0pWUER4d1Nlb085QlF2b05OMVhmWXcy?=
 =?utf-8?B?NCtYdG1DaCs1VXhEVlBweEVGV2t1Vmt0UHdNVXhtSzdjcS94a1Y0akM0VHNy?=
 =?utf-8?B?UUIvczJKZVFjNS8vTDROL1l6VFFqeFlLOGNocTlkWUxLSEpjTmdoZ1ZxU0pZ?=
 =?utf-8?B?a0NUZlVFekdCbWx5eXl5aDRHQWpvcnNYZXQ5aW5mRjI0UG0yRTVxTVZIalo5?=
 =?utf-8?B?bjhINlcvcEtrcnFtMFVqVGFmeGZrVFM4Vmw2R2Nkc0J1blBVUG90bjMxYUg3?=
 =?utf-8?B?Y1ZaZm9kS0N1MW96RHVNUGJKNEhONDJmTGlzdHlvbytmS1BjQkhtMjhzN3gz?=
 =?utf-8?B?OHJZaFB6bEY4U29iY25WVWk2YkhCb0czTFpNZzAwcWRZNGEwMlJScU9vSXND?=
 =?utf-8?B?V3Avb1ErS25ObmtXd2lKMkgwOHVKc0RZc2dsK09wUXdmS2k4WVlaYmg4dmVu?=
 =?utf-8?Q?RbiJ95/Hy5rYVwr58uTCRFM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77253aa-69c7-4057-723b-08da00dd2448
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:25:02.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kttSbE9FUxQBb9gdcd1UkWS+Qynlcwo0KJtU/1RFDDO9R1r01bgY9WFuUTzOXt/k83rOSLhCdY+tclM94zWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7126

On 07.03.2022 22:02, Andrew Cooper wrote:
> kexec_reloc() does not return.  Plumbing this property upwards lets us mark
> machine_kexec() and machine_reboot_kexec() noreturn too.  This in turn lets us
> drop some unreachable BUG()/return statements.

I'm certainly fine with the added attributes. I'm less convinced of the
removal of BUG() - I'd prefer to leave to the compiler elimination of
these when found to be dead, just to be on the safe side. And I'm pretty
uncertain about the removal of "return", when it comes to old enough
compilers.

> @@ -403,9 +401,6 @@ static long cf_check kexec_reboot(void *_image)
>  
>      kexec_common_shutdown();
>      machine_reboot_kexec(image);
> -
> -    BUG();
> -    return 0;
>  }

In principle this function now is also "noreturn", but I think I
vaguely recall some compilers warning about "noreturn" when a function
returns other than void.

Jan


