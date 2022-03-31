Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA84ED743
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296854.505453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrQr-0006Zx-1U; Thu, 31 Mar 2022 09:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296854.505453; Thu, 31 Mar 2022 09:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrQq-0006Xi-UR; Thu, 31 Mar 2022 09:49:32 +0000
Received: by outflank-mailman (input) for mailman id 296854;
 Thu, 31 Mar 2022 09:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrQp-00061A-5O
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:49:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc672d3a-b0d7-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:49:30 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-9cWyOcaZPTeJwQBJ-cg6Jw-1; Thu, 31 Mar 2022 11:49:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB3264.eurprd04.prod.outlook.com (2603:10a6:802:11::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 09:49:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:49:26 +0000
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
X-Inumbo-ID: dc672d3a-b0d7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648720170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
	b=aoBnjt6+glCRqKYvhWRwLixJ4A9ZW7DQtJeH7/BPfeZhmwrvJ8M1bRFRctzJHFI+iiEdY3
	cSkryCGRxDc74iY0W/F1sQGrKQ9HJ/VJJLNWdbaEtU0N4VVBa5L12BgcQqxC7gSUEUAHDB
	Dywbaou16EJHj8ZVBcRNP+wWUQnDXDE=
X-MC-Unique: 9cWyOcaZPTeJwQBJ-cg6Jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6HKUaI6hAPF/qfzmEeIG6ashHBUg+9ou4depZltvtzFff8xmu7AOs0dAW8+LNrsKJyYIt/hr0ZX4Karux+QwICWEPbNqBM53krR96bLxz2oM7UazJ+TxcQ4eKV0EI+A2vxVwODXYN/aM3EiE+iuNidAjCtuKQBhsdRh3/OGLDneFksRgyS2ndHY63zQli4RVed6j9m4Rqnj+ZnMm+14aOkLQo8as6xsa57AiFmlwEtqYGKOGCCE2NzYzomWBpTuM+AXR/ELNIsd3iJyXyBjBXXJwakF91KXWETcRJF+5s7peCvwqOf9S0eWqRdWHe9mV5SKzGldeJSF8EU7vEW0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFSJGrEWRuZxL/lqFamJoez8zlHu39Sdg/lvj6ulEMc=;
 b=PUNrxXtszns2zAt4EE89WeOv0ElhZIAfxDPx8qimtm9ciqTOsE9qlV/XI/EK3xA27v6aQ6FWiFOM+bJ+P27npkBc5BcQYcrwRSNtUE1HCZAcTC/SE+HkfDwyEgroHJY2CXCGsPZV4xYaCNqUfFjll0K1LAQWpju9pfHkMtgLpXvilnmpvrgN2ZSGciT0lVmShCTXHnVhAwniVUw2HiTKMf79Y/S31xx5Fi8iFpIr2eBLB3deWDY6Mekfe4AEkZh9LTtSMJwSwIHnhr7uNZLAh7VRW1wflZT80bBp04Y51a82k8+cr8gxFTExyAeTw/AluS9vXVyAVsEXoPNsvCNHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e4ee27b-4904-b2bc-1650-df148b47387f@suse.com>
Date: Thu, 31 Mar 2022 11:49:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 5/8] x86/boot: fold branches in video handling code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ca1b11-0074-4c80-8d31-08da12fbbe17
X-MS-TrafficTypeDiagnostic: VI1PR04MB3264:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3264FDAC9B56501DCCE220B8B3E19@VI1PR04MB3264.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N0vAaVsYAgOpWwNgby88QHYSw08UBgReEVbBDMQwPp+5w5tj8020q1xSbOo0SjmDAfJDTig8OPZClLtwNNnuXBlVb15dWF5dhfC+1eK8yPaZsX+1fuWsxo16pLx+yqVJQ+5Mc/6wcNWojbWC6tJ8p/Zm5Ur9f8+WAsv58So1USCTP9ExQaoUftuJqR6ddF92nguBipfhGBFP4PrQM2LBrXsfkdllSHVgVD695xC7bshTCXoojqp33kbz7+Lgpd8pUt5UMTgZOqCFU3HiLr9d/CkGucjBi/pjszM//pHXf7Hv05gNmRTy8mYfuxvn39KbGBNW5ytLle0F6ot1lv6FaM5tNaHP44BRE8GqbmuyVvoAWI2mv2cD+XW1mCIwB7JPlUFkyXgrtu7G92T3pyMllE7IBFwpuUiB2g81yUhe8F9wrcAMwNVqML0rHvnY9SXasDvfulH5z5UxsjxWhyEdqAfrQKfZmcp/GpjYVnODqmT2S3Tj5GjvExzI3X4Vxhc44IH8BBndvyuY2ZyKClCKjc2+Yg8JzAElnO3Hk8BE5dS7u++7sYGiuFg78E6FDCwTNtJ0zO76kJ9GCUhwLOTah0FM/R6/Jk0Oj8sHi2bqrtewFNexl4I7rmhUUr6QOahIdDYXYJkM6bbeT/WtPN+hq1FUtMGqBVCGlAIllT+sAvSCw/MDL8AXDHU3yooL2AKIO3O9iyHeJhjL/ID+uQbSu5AFXR+I1NqqxT8MJz2o637mDJ8VegxCtuqvtmLY4qQ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(54906003)(6506007)(2906002)(86362001)(4326008)(8676002)(66476007)(66556008)(66946007)(508600001)(6512007)(6916009)(31686004)(36756003)(316002)(6486002)(2616005)(38100700002)(186003)(26005)(4744005)(8936002)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0N1NjVBNmpieEMvbkJYNEovSDFieWMyUERHV25pTStndVJZcGVPdXVUY1M0?=
 =?utf-8?B?RmMzMlZMOG1uM3VHdlhLSVE1LzkyN3l0UVFlUW9kK1hNS0pjMjFwaFNmbS9U?=
 =?utf-8?B?aXU2R0JicFdoTW9Za2JqdFBzY0lPN3IyendHTTV6MkJaL1hRTFM2VUR1MUdQ?=
 =?utf-8?B?eDA3bko0ZEkvd2k3QmE4Yis0cDF4L015T2JkRDc5Z3RHMEg5Q3E3ejFnYkw0?=
 =?utf-8?B?Y0J1aFQrSlppWURTRUpxZVp3U0ZudTVMWm1BVHdZbTRCR3ZsSTN2QnMwckN6?=
 =?utf-8?B?M2QvaDNBUzl4QjcrTEpHRklyY0RnTi92NXRWUEpVaFl3U0ZLQnpBZzZRcGtE?=
 =?utf-8?B?ZGlJK1lWendqMm9LamQrQmZNcXRhSlBuV1FiNEs1NWJtbFUrUmZBWWtEVHhS?=
 =?utf-8?B?Q3BmZkJ5T1V1TmtpTi9SVUxrMmVOcHN0dGoxdFg1NFZ0QlFFWDlHZDhTeVBW?=
 =?utf-8?B?RVpETFVpcDdheHF1ZUFCamNpMFdZbkE5ZWd0LzZNc2J4aDhEOGxmUjFLdElo?=
 =?utf-8?B?THl3U0NxQitSRTFJUjVYVGRleFBmWG05eElraFlhSml3azJiZy9aNEdwbmhD?=
 =?utf-8?B?SzNNMWVtckRtZDE5bk5Ga1lPVUlrb21FV0twUk1YeGZXK2p6VE9KdEx3d1lq?=
 =?utf-8?B?a1oya3R1ckxjam4yeWxPSTg2YjRpNzlSRjlpWENISXl3cVFsQjAyM0YwWlV2?=
 =?utf-8?B?ZzNnM0k3QW5kWXpLNGY0S2N4QVliMDdTd1M3VnlkT2ZmNTRHaEJ4d0traWk1?=
 =?utf-8?B?N05jU3J0TVNoWVNDVHhpLzgyWHBJZlhkanNhbFF2YUxVdTMrNzJuN21qLzAz?=
 =?utf-8?B?OWczYlNqZUwzRHVxZXBnWS9WcDZQNUYzY0R5WTJIZTV2bzg3akpxSTdCdCs5?=
 =?utf-8?B?MXlFdmREWVBFa1FGODljQnlUQkxSV0V5cjZPeFdQVzZrdEZmQjYraHFVa2VT?=
 =?utf-8?B?L1V0NENtNW5WdFh5TnFUZUZINTdjQlBhZ2ZKaTdYbGJBblVobjJ2SHFaMzFP?=
 =?utf-8?B?MVhHSjlVRFNPZEs1Vk1yY0E1N2xFOEZxazhUWFhGWXcwZ2c3a0I3OWtob2xD?=
 =?utf-8?B?NVF1Ui9XREgzZXNqQzJGejZTZDd6RDBtUm5SS3ZpU0ZsTENCU3JZNVJ2SG5H?=
 =?utf-8?B?MDh0eWUrOXVlbzg1YU1XQlZuSHNQc1FKRFJKT0pFclpzNjRRYkpTa0xZK3p6?=
 =?utf-8?B?eVl6Wm9nU2xvUmVkNUFMdU05WmZ1cE5DQmJSdWdUTEwyMUxNT29paDk0YWhH?=
 =?utf-8?B?N2JwWklIcGpjY0NGUFV3NG9za1NIUkwrYU9Yd1BVWnJDVkp2eWpuNU1aMTV5?=
 =?utf-8?B?c0pzN1pnbnVzaklnNXpFL3dVakdOcVpQV2lob3RLeHQrYWt3eVVqUjVKb1ZI?=
 =?utf-8?B?dlloZUE1b2xjZ08vb2J6elhOd3VlUkdSaFMrVGlWa0JLQXovWFp5VUVRZjR5?=
 =?utf-8?B?cVI2ZGFsYkk0TzNoRGNCUHhTS0o3Q1JIZDJDSWJZeHpaT2t4dEpyaXFYWnAx?=
 =?utf-8?B?QVVVRE1rTmp0WVkveFoyWUhCbWZ6N0ZGeHVSdE5IKy9FTDZlZlRRUzRzczI1?=
 =?utf-8?B?S04vV0JjUldHZyt4MkpvUTFLQWkxV2o2KzBGVEJuR3dRVTZYOHZiYXB0L3Rh?=
 =?utf-8?B?alprWCtzZGYvcS9kaDlqTDNNTUxIeWNHS0JZeUtLTkMvN1czbWI5N29aUjFX?=
 =?utf-8?B?OURmWUtQK0RyUXhaclcxOFRCaVFiOVErOUdHWDZxRjNmeFR5T05LYkoydGt0?=
 =?utf-8?B?MlI1cFlTM3JaNUpVc2ZNc1dnOGY0YllDR29vVUVjSkNZRElTbVdkbVVybzl5?=
 =?utf-8?B?eFZUSWZaWmtpczFTTklJMlFJckx1L1BiTHRrczh6QXYzNUhUZ1ExMTM3V2Rl?=
 =?utf-8?B?RDdQZkpFS0lhSkl2ZTNIcXo3TDM4THVpL1ZiQUJuQXJlNzUyb3pnLzllbThk?=
 =?utf-8?B?UksxNFV4Ri9QOVVvZFRpeXY0ODhzZmJjS2IyMTFrRjNsMGRjN2lGbDFIanpj?=
 =?utf-8?B?bnFza0pYVWRtTGFvbWMwZ1FhSzB0cTR2N3A1Ris2bC8vOGI2a0U5RVdOM2Zm?=
 =?utf-8?B?N1lydjRaOXlORURHWjIzVndSKzQvRjVEbE54ejY0VEliVzBGVk9WNHJtWmIy?=
 =?utf-8?B?VVhJNHJwdUZQUlQ4VEg0OE5va2tadkttODl2ZUpjVzVCRk9JcWhLaGFWd1kx?=
 =?utf-8?B?NFBsNFl5K2FpWFV5RC9CaXJBUkpXSkwvQWJ6aGdWMzRJdHZIUm1ma3I5V2Q2?=
 =?utf-8?B?MHI1YTl5R0xWRFNSQit3L3c5VXpLOWQvR2NEV21hMkwrUXRlMVFEVTlEcytH?=
 =?utf-8?B?VEFwajBwQWJWZjlKdjJQL2NFOFROcDFsQ3p5cG5EN202b2R6eCs5Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ca1b11-0074-4c80-8d31-08da12fbbe17
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:49:26.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J32NOlCrpnEaeGoxte9mf0E6ec6EiQnGqhRDXfbVS8bDRSDNZR6DC7Fo+G9AHhGhQlg17xcaNQ24rVJmFHhLoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3264

Using Jcc to branch around a JMP is necessary only in pre-386 code,
where Jcc is limited to disp8. Use the opposite Jcc directly in two
places. Since it's adjacent, also convert an ORB to TESTB.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -332,8 +332,7 @@ lment:  movb    $0, (%di)
         cmpw    $0x656d, (%si)          # 'me'
         jnz     lmhx
         cmpw    $0x756e, 2(%si)         # 'nu'
-        jnz     lmhx
-        jmp     listm
+        jz      listm
 
 lmhx:   xorw    %bx, %bx                # Else => mode ID in hex
 lmhex:  lodsb
@@ -401,10 +400,8 @@ mode_set:
         cmpb    $VIDEO_FIRST_VESA>>8, %ah
         jnc     check_vesa
 
-        orb     %ah, %ah
-        jnz     setbad
-
-        jmp     setmenu
+        testb   %ah, %ah
+        jz      setmenu
 
 setbad: clc
         ret


