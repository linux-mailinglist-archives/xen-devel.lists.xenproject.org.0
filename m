Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1AA77620E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581139.909700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjpa-00029X-7V; Wed, 09 Aug 2023 14:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581139.909700; Wed, 09 Aug 2023 14:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjpa-00026t-4l; Wed, 09 Aug 2023 14:06:34 +0000
Received: by outflank-mailman (input) for mailman id 581139;
 Wed, 09 Aug 2023 14:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTjpX-00026n-RT
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:06:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef90a1bb-36bd-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 16:06:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9388.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 14:06:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 14:06:27 +0000
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
X-Inumbo-ID: ef90a1bb-36bd-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKEfx+RThUtbNvHdDgsfKz/HFWDbQo41PQPxMoFy61JlVcQ7/O5qc1Mn5m9k6Up2ME64QFI20a8gbOEgG8bUM6QgaFurWJD1MUTEJr9W9Bzy1YcrJyVjQwXTUDNLn6haAk8mce9y5XpmIfBxASlBoy2Ui5MXGUVyeELcJDjfjAAFq9p7xsU52P/Ld02eRFkcykYPVgFSGCK0F+Q7phDOCEq70Io0sBkWYYpOGgxWNxtnxm3pGtlpkpdpHd7ZUp1GFz/FJpa+8vq20JVmNFWwzZK/Cvz+mx2PyOF0JWbMMecN/Uouvh6VxtFX33EUThg7EPREyXFaTrqpciW0kpGPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhUA5NsuWDlnopf/bqdUYEngu35mooPiQlSbCKPaHSQ=;
 b=AKGlm6msXo/CLA0RImfUQsj0xRCLr/dEGTBhUzW9Bo2Wnet3D8n6JNNlEt7pjOGqVZN3ho+45v4WqkMlg1kuKY7dCIfA2Er4DsS98cbgXYISw7r3217cjr6gIGJS5RwgEVCxSApasGZhAo9EjRsYUn8RNcHDYnXgNb82Uk/+Qf+oIkNgxaO6G5Tkulw14AHcEowYcoCUMIaWHIAsBeT1guF1fNZOeWQSeS30gD6X9Pw9YJENBDJ6SMJTPv7x7PnHlrJQ33pCFWIpD+w8VHT1b+3aG6uCYAer7X1j86ffoKOoLUUn0lfBMM1v/dvZZ6R0I6QujJ9V0PJrmtvlE3ITxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhUA5NsuWDlnopf/bqdUYEngu35mooPiQlSbCKPaHSQ=;
 b=RYA0/PCpgW/83sjuJMrYfIaFUF+QdFeDkHUw7QFUc0kktAg5JTixrVNGP90UUrhio2Orl1u1L2FneeIv3KNbCPynptR6hd5VhuoYDXiLf50rNIsh4ko9GuDI8R4O1a2Nvqb59gpvAdUpYSuu1NtUJNmyiKGF5wTxhudNbshPNMz7isKZzRRifUlqXh4/3FBMO0KTrnWh20i1ikD3lQAQnLsEjGJp7Rz6zfCc1BG31pM8loj+UXCm5Qj4pqIxuRzVXSQYEHJVfsSXyAvHF91vlnKCdIHozy+tKTuWZ5vpciwpsYGIAOxe0Mv1BwpWvcnyu7ndo317xAUzuEnc9YVOJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <041f2137-8a90-79f6-3677-f764cb1b6656@suse.com>
Date: Wed, 9 Aug 2023 16:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
 <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 57502bc4-63d0-461c-c744-08db98e1d2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KrIkVvsj5B91x2rTfrE5fdeENn6P1PJavRXUeo7BvHPVU+HLRNZjyglHxmg2lIUxn252mYHm/IaKYTFdFpGTH1gri2+6hKL49fZYYmUp9DDktPwTsgNshX7r4p4BTvUQmRrXc86sng588Yvzp476cneJnr1G1Nzr+p2FbeD8jnuaxEmFQO8sc2dTNs0EuYQiwRFPvXDaHnsVSjZJh+KKrrcXUG2hj4EPYuFTidMhXOONq+SUui3eGKUjwxHexP3gu3BzrX6v/nheJ3+O4KfcAgprxrWJiLDc1t3F0x13oXU8ehX3naT8gnPsSq0k85VSWCT7qmu9X2y5it3iCmLG3xhEHmR8oVwVM0lEmYTCf1x2A0EiGlCoNLBGhN9XEcUTo6zqY9AiHWO5qReTDLZyZNdhEisiSmWnt83I2qIwTnDnmj39fHfl9IPTYMC4Pk2kn1dcyaRK35RJGUASaVIzLiOWJwg4yCTms+84lrAEvqYgcz9doAMM49FAlo8Viaq8jHao3SIhRuQFZHDwzO4TEFTcSgwsG9A4I5u1V+Yqfe0q1Q5MKPAZzczx36bfZCbbvewEjO5hz3u9hSBv2/tSzDuH0Kr2yosLDdx2kYAx6IZgX/hIuO/zF4EGhH8Dq2GbX1mvTw6qhtApX8e5IXoxUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(1800799006)(186006)(451199021)(26005)(83380400001)(2906002)(31686004)(5660300002)(7416002)(8676002)(41300700001)(8936002)(2616005)(86362001)(54906003)(316002)(6486002)(53546011)(31696002)(6506007)(66476007)(38100700002)(66946007)(478600001)(66556008)(6916009)(4326008)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anN1K1VCZFBNR3V2Z1hOWU5zTDRYakxUc3Y2QUZiZXhKazBvZXFBNUR2YmNq?=
 =?utf-8?B?cHdrVnNhYkZLWnY3SXVpbFVVVXp0RjNFMHUzc0lhMHNRV3VubjlNSEp2NlR5?=
 =?utf-8?B?bzdXb1o5SmVJUzI2SW5jeEJqWkYyWTlVTnM4bys5cjNVNk1SaDJ4M1J5SlV6?=
 =?utf-8?B?Z09XQm9Dc3JJVTNYOG1Jb1dZNzc4bmFBUDkyNXloWTh0ZVp5aE51N3BYQk1y?=
 =?utf-8?B?UnZBUTZSWE1mWGN1MUVkdHVCdEhhYU84b05mcGVJWndtdW1MRDVXa2M1cldM?=
 =?utf-8?B?ZFdRdmZxWVNwa1lwZWlZOWszUTlHdEtJUlRCMDlZenpTa014ZE5zeWdndUkz?=
 =?utf-8?B?VzUvR2ZjQ1YwbjYwazJNWGU0dmNXc3ZKdlphUGFQL09YK0x2UmVBVlVXSmlI?=
 =?utf-8?B?U2tvZDJkRkQyRlB4aTdGd29aMVRZVjVYNWZ4NzZRT1FXbk1rRGdCK1B3SFJx?=
 =?utf-8?B?WG52MmpaYkxyMjRwbFRBVVpENml0Qm4xWGduaVp5VVRGMUIzMG5JaXAxbUtu?=
 =?utf-8?B?RklTNm1KZlVGWnQvcUs5VUxmdXFDQUJzSE9DVXFkRG5Bd0s1dEdoSFhjNFh1?=
 =?utf-8?B?US9zRTEySnZGbFVkcElTVi9DYlBUb3FvMUVUUG5IMHBIMnkyVnQyaEF1TTB3?=
 =?utf-8?B?Q1F3Q3lzQ2JuNFhGRHJFakh5cU9FS2VMZ0hJNDNxck04cU1hOEM0VXM0QkNS?=
 =?utf-8?B?UDFQTFNFdnlpTUNmOFRLeFBMMVlFK2RMbzdJeldBR1NSQ0djTkZORS9EL1RX?=
 =?utf-8?B?c1laUlRHTk1kekNzc1k4SWlHVjdnak5rZHIyaE5IZzZvVWExdlVUQlFDQmwx?=
 =?utf-8?B?QnkwMmVXZ3NmN3pUcHdtcVN6TWEvOXo2ZDEvOTY1MmNwajJwbVBmd3pEelFE?=
 =?utf-8?B?NFNFWEljYytPTHpOVldDYWNHcEtZK1BlU1lrM1Z5Sk1JQ2RuakdGV2djVlpI?=
 =?utf-8?B?T211RThuR1huUmh4c0pCNnFhalYrbmVBKzA4WVFWbXEyT1hrUTNackxCNGY4?=
 =?utf-8?B?RTBCZEc4aUFwZ29OZEU2elM0cmlZajBSWVgyZFZUd3EwUFB6RG5kZDJWOGN0?=
 =?utf-8?B?czE1RnBlTTg2L2JvbmpQYXhZWFdDR1NBNVR0cFhqS0NpbWhralNEKzVaUTZ6?=
 =?utf-8?B?YmpJa3BnT2VhTnJPZ01UcnJ2MEV1dkw3UnNIc1JJN3paY29vWUsraVRtMFhJ?=
 =?utf-8?B?TFIvbnhyRWV6eWVQOXU1c0pFM1VnbG1Xc3Rjc2N6djZTMnFraUw4dDduL1Bz?=
 =?utf-8?B?NEJOQk0zWi9MUnpIUHRRc09sWGFBZ29tRGVRZ0pQT3c1Mnp6ODVQcmFhYkIy?=
 =?utf-8?B?Vzh0WW9CcGt2ZzNHRUZMOTFpdEFrSkpQaHNHcXU5WElNL0ZMR1RYMVJlTzMx?=
 =?utf-8?B?Nks2Y3BTOHZNOEpNdFJrREExRC9CMTFFejQ4SmhySVZ4QmJOQ1RtT0xDcXhD?=
 =?utf-8?B?UWx6ZHVVc3VrcWlGWVIvb3Rid3lSWG9uVnYzSWpZRnNkTDF1R0RJZ3d0aDhX?=
 =?utf-8?B?czBrME94bVZYTk9wcHhlUy9RK0VRbEt2RFFjNnltNVlKbmI5WU5TQVFTNU14?=
 =?utf-8?B?ZWgydVNUeDIxSHQ3UlhGckRmSzlhaHVjZ1VKZFZyQVlCZnRZVXhQTkpkdzVy?=
 =?utf-8?B?eFcyS1dxNmVtMmNOSGZFam1hd05aVEZxSHU5TGdPVHJiNTlVUU5ML0ZzeVBi?=
 =?utf-8?B?bHhOYUVYRmpveE1mb0dGZG1vVFdzd1hFZDJmSkltMGZSUC9vbnRCWEFIcVlU?=
 =?utf-8?B?blJyYjhDMmZhOXpXb0R0Rnd3TW51bWZXRUdScUV6enVuM1VMU2VWWUwrMEJX?=
 =?utf-8?B?MHVNYVFEU0paNENPV0tzVHNsYkQrOThNQXRhVlo4TVZURFdGZXRlb2daZm1j?=
 =?utf-8?B?cDdpM1NDWHZzOEtyMnhLVGJJZjNYWnJtZk5mUkxEejFNV1A1eTcwc09Ha0Rl?=
 =?utf-8?B?T0hFSHBqUmE1MG85aFZJc21mVzFUeDhrS1BEK1E0VERRYnJHWjgwZ2gxRWhm?=
 =?utf-8?B?a0drVXp0c1BmYjhGNU1vZDRxbDR1eGhpRHA5Y091OTF6dlJsaG0zWFVHRXRj?=
 =?utf-8?B?dXUrcXhsbVlHdUZCak1Day9MOENPZWVybjlIYTdNZ0NQM3V4aHkzcFNyYWZv?=
 =?utf-8?Q?JcT4kafLW0L+c4ARSZ+8h8yEJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57502bc4-63d0-461c-c744-08db98e1d2de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:06:27.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+wo8ux1t5j4Ss2bUkHPRG0Z5Gj+DH4GDOP/Hdq7vmzXruFTuVZYrx5zooio8XHiEP8bgaZTihrOI+LsdLWrVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9388

On 09.08.2023 15:50, Luca Fancellu wrote:
>> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>
>> The variable 'saved_cmdline' can be defined static,
>> as its only uses are within the same file. This in turn avoids
>> violating Rule 8.4 because no declaration is present.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> xen/common/kernel.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
>> index fb919f3d9c..52aa287627 100644
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -28,7 +28,7 @@ CHECK_feature_info;
>>
>> enum system_state system_state = SYS_STATE_early_boot;
>>
>> -xen_commandline_t saved_cmdline;
>> +static xen_commandline_t saved_cmdline;
> 
> I see this line was touched by fa97833ae18e4a42c0e5ba4e781173457b5d3397,
> have you checked that making it static was not affecting anything else?

The code requiring the symbol to be non-static went away in e6ee01ad24b6
("xen/version: Drop compat/kernel.c"). That's where the symbol would have
wanted to become static. But that was very easy to overlook.

Jan

