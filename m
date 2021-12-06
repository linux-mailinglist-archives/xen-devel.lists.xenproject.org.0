Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8445469745
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238958.414184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEB1-0000KL-8g; Mon, 06 Dec 2021 13:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238958.414184; Mon, 06 Dec 2021 13:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEB1-0000FE-3z; Mon, 06 Dec 2021 13:37:07 +0000
Received: by outflank-mailman (input) for mailman id 238958;
 Mon, 06 Dec 2021 13:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE68-0001ky-E1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:32:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5ee144e-5698-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:32:03 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-C6k-nKTgP8C1J_jTnYD5Qw-1; Mon, 06 Dec 2021 14:32:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 13:32:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:32:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0164.eurprd06.prod.outlook.com (2603:10a6:20b:45c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 13:31:59 +0000
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
X-Inumbo-ID: e5ee144e-5698-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWQiEscHMitckPtyowVTpPJHsuAivRldTvGBRFOefis=;
	b=ajxz1CLmt/FHzTqXjAthCwCKhp9jHcLu1ldwV5FHSo+vY23iXkL4FZUOLsFo6lerdtqBSE
	opwPHH+rUV6U5+UXv9+ytScqeQLVv2LEcJRTDl4G/Lt56F019e2rSCkIxifAh1FLL9rH+E
	Bc0xRPqn15m264KCKNOklEgAvX5qQjE=
X-MC-Unique: C6k-nKTgP8C1J_jTnYD5Qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+zX6MH6j8KzjVL8+V2jneBYcmEqAH55NfIQ1Z0VUdO8VWSOAwdaWXa47EtMCwRb294F8V1hjIJvGCvMvCRI5ZBCq4CEaqTRVwJFYl4canveTG3ByhkYnZB0zhXlL5ao/gGtiaxAq3NLRDHRKD50qQBXkD7Pq9FjTISYK0fP3gChrKr45kLHnF5B98n1hUMKZ6S1esmCZn+WcCwhWXnzoWJqLxuT86O1axsjz6etWIUh3AaGQrce02v4GzGfRATkHm9WLlhmAFWNIIZBG8jUBXmyfp35CjXoISZ7tiWVLalX85lLwAy4XvNmyvlEkZ/T5vDVp8Zv6EGOJJxDicQqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWQiEscHMitckPtyowVTpPJHsuAivRldTvGBRFOefis=;
 b=C4lYfd5u8+rfYb4FiJJApHqJFt84lnEdLzquapTlmZmG5u+anwYt8vpLogNOGwp0LHxuHC1coFytqjZ1Sd2/9Qi1s5b8S58F1sVR9NAf/cX9BA/H48lPlU/bbNtpXO3QF34dfhSPQxnsWU6lujkICWMrMjiCCwqHEFHOOOcz8F+3Pe/abeFQMTjriXkDeTUn3OAN2K9ExlSJpgcwV5rmMrAyTWArluGZjI1rgpv22TydE6OprDSqhmlk3HFJr9R0Mmo7Xcr+XDqsxqy9Cn49tyQCeg/9OPYq/EBfODmWC1NtqsJ/jWm4xc9ThDI4nyDLCGDypXQT0U7tfk/6jXuLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f04d5ea-e0ef-6750-1552-3783cbcc0125@suse.com>
Date: Mon, 6 Dec 2021 14:31:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 4/7] xz: avoid overlapping memcpy() with invalid input with
 in-place decompression
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0164.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af54db1c-8ed9-4f69-1620-08d9b8bcc851
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB295741F595E653930EF660DAB36D9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fJK7mQ8UQQz0ACv8kLYabRXWpjpgfAN8FidIxTcMKEa4Dg3faDcChbhSdIRNR/QNfUFHwpDc6+kq7df4hTASHV/IZHTfx7sMPepSdx1bucVu9dyOQr33hgnldnhd/UtfVvOOfdIlGfnqcy5xIngib5D4b1ehIR4vH/rpFUrh1ldph68r3b3rz0SQ0aMGHCRVNP6nsSECSx5NgDL7+1wamU3+ZR0q6yanxpLSgnRNBZTBzttyrIv7li2+6GyATI3sBcRE1gsW5nve6/DxyUg7UYQDeQirHOpAjjxD+vS9nV08i4ymYwlh0lSopY3Vs5n6a4xgBwXDX4YULsG3YTE+3js5x4sd3wN6KMKwobwRie3jFL5+Bv4H4DEPiTU2nV6GkoOINv4WG0eIh627z5c1339uBmkUY9/fe3BS5eHLBE98IxTxE+7zMD/ZVntUPgGjfawisOXBA9bfgfrG4J2nsbqkw3dft2nlT0u3zxhNP8FYq0qpaIEHpSd12W44W2veXtAWKlTMc+opjobUfyVMv19FJTVfFaK95b0hpAsHX8s57p5FDVB1WEh5Znip5prGyh9CS1q8Rke+1laKR7+Jb1mzRftRcPkPKr9i0ZLavHnLhANJE+mIG+IPox6uOM902NQ7iugFT/nL5FxQDwahu/IGSNhUj46mWpgeI4OnfWf89ii8gFN6jesG2MsUqqkZ3L5CJo1wtSOguH84az6pRaXWMisii+vmLIyvmSTB2Jf+dmec44xbo/rcdJZzRghhYwoWAQneT7ADoUC+v6IDC22l8prJX/Bo70uhcdEHuD8AZP0lVUYa0QJLiYvN1Wdi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8676002)(36756003)(31696002)(16576012)(6916009)(54906003)(5660300002)(956004)(966005)(2616005)(2906002)(508600001)(4326008)(31686004)(86362001)(6486002)(26005)(8936002)(186003)(66946007)(38100700002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTF4cENrOExkZnRTblluSFZLK2hFV2E4VDlTUGFCK1VhYW8ySmtLeit2ek56?=
 =?utf-8?B?SUlFbjNTTlRTRFZacGN1dmRtTzF5VTczRVBxZTBHNkc2em9oa0hUL0J3d21T?=
 =?utf-8?B?T0hhN1B6cDJQR1dCTGVTVlloSUoycllLa3dlVEkxYUh0QXcwNUxMVVZPWHFO?=
 =?utf-8?B?WFpMRkpZUGF2Q0QySEdQN3NRTnFEMFdRMkkybzNJY3ltRkdhM3RPUisySXNX?=
 =?utf-8?B?Y01PV3JLOWZDcWc3b3JvQ0VNYmRDYzBLTmx2NFIzeEdUWUJOTFduMUxxVG1t?=
 =?utf-8?B?bSsvVDhOTGkxZ0I2eDZrMlJ1c1hzV3ptWjdjalJIWm9SMkRmdktadTQ3UDk5?=
 =?utf-8?B?NEFsSXVUWHp6M0wzcnQ1OVZVZ0dUcDdVMXoyemRlL0Q2MUJ2L1hkeEtTTXd4?=
 =?utf-8?B?TWUyMzlRUVd0MnVyVit1TWVwU0drYkVkRVBVMk1YeTZReEdhOEt2WnVmOGVN?=
 =?utf-8?B?MUtwQkQ0a3JJejZQMk5lODhIMXFyK0hlMkZabHBuRnFaei9rcUZweGFJaHoz?=
 =?utf-8?B?OXR3VG9oaFZwWWxLMVFLdmNEZ2lrbEs3bm5xK2tKZWp5a2pZamJpUS9UaW94?=
 =?utf-8?B?MXBNWjhQUnoyancyQmp0SDl0SERpUkVqUDJCUEd3RDN3b2RjZDRRY09FWUth?=
 =?utf-8?B?ZXVpRFg3c2oxRFpwZ1pRWmlhbW5DWGlJdVIraHRqbFMzS2w0ajhURUluZkpa?=
 =?utf-8?B?OGxVcWFPRHZRcVZIWndVUDU0MHVoY3RLSFRoNkorTjZMMVd0cVYxei9iWFBF?=
 =?utf-8?B?ZkxnbFl5N1I1bXBiU0xFSFdZWUtjSFFsc2ZRUzNIQmNsS3VZYS8rb2p0dlU2?=
 =?utf-8?B?aHRMODVFUHdUdTI3R3pQZmIxMElMWWdoQnBWMDdEaTljdzdEbXJtT1V2T0Ex?=
 =?utf-8?B?emZrQko5NGY5S21DeU5GYnJ2V05hSUNsc1I0c2xTRERXYWlWZE1VcW9mS0RL?=
 =?utf-8?B?eDNMdVluV2RVNTU4KytKbVI1cHI5Tk5SdjBQZVZUcnUzL3pOd1lMQUs2NEhy?=
 =?utf-8?B?aE5uUzJqNUJ0ZXBTMTVOcWRxMC9vY0g0dmNLRDJveHFaRStNOFBveGc0VmVY?=
 =?utf-8?B?aDJab1ZNenNpTTNQVnErY3IrVVZaeWJxTlE4bW1Zeld6OUdJWWJoSm1kVHVJ?=
 =?utf-8?B?eVFjeE91OWs4K0lpeDRhMlpFRUdaOXIzeE1pRkJVKzVOV2ZpbU8yN052dG9B?=
 =?utf-8?B?cUJad0hEVWxyV3g3RFZGSVl2YU9KYjgyd0ZxK1B6U3BBYXdzUkhxeHZ4S2g1?=
 =?utf-8?B?cGdEdFF3UnVnN016bDZFbnh2cloweXRxNElKRkFsbkFMOUM1d0I1b20xaUg0?=
 =?utf-8?B?UU9OVEtSNElSajhsNlNGS041VnZMZVgxWUdzMGdIVjNGSFoyK2s1RnoyL0ZI?=
 =?utf-8?B?OStXcVg5bk5KRUo2SXV4VExVd2ZGWHpCQVUybktrTEg4MUNFR2t4SWNFcEFx?=
 =?utf-8?B?N1pKUkpZNlY1MmI3OE5UaUlHdHRQNlg5WHYycEI0ZzhHakh6N2REdTdqT0Rz?=
 =?utf-8?B?cEEya2lpbW5kTDIzNkhxUmdFVTI5SzVwRCs0WjJpTjBRZmQvZjcxWlJ4UnJR?=
 =?utf-8?B?M3hhNURrRFZNNVlTYXZWVEM0NEpsQ0pDY1BiSDhUcndrQkVVKy83ZHhBZGpO?=
 =?utf-8?B?OUVoRU52aUp6cEUwZm8yOGI1d1JFbVU4a0NyeG80L1hSU2tFRDVJMHJHNVRQ?=
 =?utf-8?B?ZUVWQ0NNSmdBWkJ1Tm9JcEpLQWJTd1V4S2xXUmlSNGV6K3ZCeUxjMVdaN0t0?=
 =?utf-8?B?aWRlZ1lTOFd4cEZyVUsySGM0RjVQN1poMkI4L3NKVjBNNWUxRTM4OCtjcU1F?=
 =?utf-8?B?WjlDcEVheDllVkpDZjFIS0tXYkFmYUlteVdsdVE0YjNOaGpuM3VuWkxTZGVn?=
 =?utf-8?B?SkRjZHdVY0lqNUNBRndKdEJIZ1o0ZHE0cTM3K0F0RjcvU3FRV2VIeC9XeXl1?=
 =?utf-8?B?SlpkQjdNTUlxZTJYZy9Cald0d3duVnFFU01NYmZ6TkNXam1QNmtBdG1ROUwv?=
 =?utf-8?B?T0N4eE9pNEkrTks3V1NkSldVdHRUL0l5eU1JK1dNTWpVeWpwOWRSQTVMWURQ?=
 =?utf-8?B?RklqVmVkb0pZRERQVzJ3U3o3bTh5Y3hTb04zVWR0QkoyRjMzM0pZU3YzdnFQ?=
 =?utf-8?B?ZGVTdmxZZTZRVUtZOWhDTFNsSVdBWWNvRWROUzE4VFZ1U2RJQ2E2aENaTEJk?=
 =?utf-8?Q?DTwsdw7q236ELH6WjP46y8Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af54db1c-8ed9-4f69-1620-08d9b8bcc851
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:32:00.5844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ieVMLoUdiuiDtRBYs+EVO47IX1iz50Qs6LPJepkHPETjfG/dPgBcZ7U62vb4oNXtLusmGsp9WipPy7eI7FLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

From: Lasse Collin <lasse.collin@tukaani.org>

With valid files, the safety margin described in lib/decompress_unxz.c
ensures that these buffers cannot overlap. But if the uncompressed size
of the input is larger than the caller thought, which is possible when
the input file is invalid/corrupt, the buffers can overlap. Obviously
the result will then be garbage (and usually the decoder will return
an error too) but no other harm will happen when such an over-run occurs.

This change only affects uncompressed LZMA2 chunks and so this
should have no effect on performance.

Link: https://lore.kernel.org/r/20211010213145.17462-2-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 83d3c4f22a36d005b55f44628f46cc0d319a75e8]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -127,7 +127,7 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memcpy speed can matter and only if there is a lot of uncompressible data
+ * memmove speed can matter and only if there is a lot of uncompressible data
  * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -387,7 +387,14 @@ static void __init dict_uncompressed(str
 
 		*left -= copy_size;
 
-		memcpy(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
+		/*
+		 * If doing in-place decompression in single-call mode and the
+		 * uncompressed size of the file is larger than the caller
+		 * thought (i.e. it is invalid input!), the buffers below may
+		 * overlap and cause undefined behavior with memcpy().
+		 * With valid inputs memcpy() would be fine here.
+		 */
+		memmove(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
 		dict->pos += copy_size;
 
 		if (dict->full < dict->pos)
@@ -397,7 +404,11 @@ static void __init dict_uncompressed(str
 			if (dict->pos == dict->end)
 				dict->pos = 0;
 
-			memcpy(b->out + b->out_pos, b->in + b->in_pos,
+			/*
+			 * Like above but for multi-call mode: use memmove()
+			 * to avoid undefined behavior with invalid input.
+			 */
+			memmove(b->out + b->out_pos, b->in + b->in_pos,
 					copy_size);
 		}
 
@@ -421,6 +432,12 @@ static uint32_t __init dict_flush(struct
 		if (dict->pos == dict->end)
 			dict->pos = 0;
 
+		/*
+		 * These buffers cannot overlap even if doing in-place
+		 * decompression because in multi-call mode dict->buf
+		 * has been allocated by us in this file; it's not
+		 * provided by the caller like in single-call mode.
+		 */
 		memcpy(b->out + b->out_pos, dict->buf + dict->start,
 				copy_size);
 	}


