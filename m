Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC24B23DC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270346.464601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITgh-00060A-Ev; Fri, 11 Feb 2022 11:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270346.464601; Fri, 11 Feb 2022 11:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITgh-0005y2-AX; Fri, 11 Feb 2022 11:02:03 +0000
Received: by outflank-mailman (input) for mailman id 270346;
 Fri, 11 Feb 2022 11:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITgf-0005xw-C1
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:02:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 093c48b3-8b2a-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:02:00 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-BVCUc8VtMhmptrKVPFXJ-Q-1; Fri, 11 Feb 2022 12:01:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2682.eurprd04.prod.outlook.com (2603:10a6:3:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Fri, 11 Feb
 2022 11:01:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:01:56 +0000
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
X-Inumbo-ID: 093c48b3-8b2a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644577320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mqWSMNbinB3HFih3Xj9/43lf1h0NXWDh3BWfNe5x+o4=;
	b=fKZWjRQ4VoYfMfDaMlXdChD/5a5VL2hVrztgsShqXxp3KFsNRvGZxgqZi/yUNymhjJtIIo
	V5BRlGBPIjkJQ/LIDc16cByYz1YQLJnAzCQfNrvHTqJ3d7gBLfwRFZGJ4yx0CVSijr09Rp
	3gRFSjaN5XjvVS/mJVxYMvr0HFRGgHU=
X-MC-Unique: BVCUc8VtMhmptrKVPFXJ-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JatLgsb8IHwjgL+vPOvP+Xse7if746rP0tX4BcPM9YOXXcVdDRUgG3EhDTt3ML9GDATpwJonbDZKwjJqLRjx7pDF9Kr4dK9CCFw7PgV3TD0epKEerg9Ii6Aiu9d7iXT6P9QTo8SBge62akkFsYr6PtazoEalTrF6GGtUzcF1WMZzupI8Wu2kTeuPqIM9sqvXa/2Rfp93IezAKEBdbsu0M+zTVxvDRG+vigtKwNxbn8MwYWmwlYgza6U8wFklerhejcImnGR4nCBsPyBBqn/GV67XqMyTRfVvxWLPKVGvc6leSm3te6sxS8nc3LdY3oerFxZ0lYOq3atwUSVQTa1olg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqWSMNbinB3HFih3Xj9/43lf1h0NXWDh3BWfNe5x+o4=;
 b=kQPseOy+aw39XEg1OStGpwD7fEUNggyfEa97Sh0s2LB/LZoGdV66dgRHNwSJqkFRSn44oQtLMrNkYU2G9oV35QmuJ8qH/Tx1JfhfjNXmC/N1hBwiaxF+JSU0I1Dhd/mRwSBYV77ePd8PtuHkCCFLKYi2zE+Q493O/kRmbm3QlAOKGLlvZcjyGcZzCR3I9IXEdavYOv+BCAo7+eD+AqC54pe53qmeRv5Iu4P+ZbQf7vgY6+HsZnvTllgVsIOlT0RLNvQVVkRAOutG8OCEfwgSFKp8PiBaMj4mD9JGkmhmA5HMT6XlDj7sqqnwy7dcQk8xagB0AD+9tGbfQr2DlDbXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83d3077d-76ad-b35f-4be0-5e968fbcae19@suse.com>
Date: Fri, 11 Feb 2022 12:01:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: work around gcc11 bug in SIMD tests
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f1f6e9-a692-4fff-2e7f-08d9ed4deaeb
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2682:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB268235A00FAD7BFEC7EFB283B3309@HE1PR0401MB2682.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lvFDlWL0Wb3BZ2tmM8/NNPUkgzxHbXjGNsNcMHwfCVZbyIk3R3cW5D30LPyrIEuiP+53N5qmQrgQNUnJOPPDRfgpQEZo29oUChIaOh1e5d3+j+G0b0ohQGlyfizOq387e7MX++F15q7+Cxb4dOdmTI1iccyPB0dH6rZQ/lxoc36rTI068VsLyGB7Nd+j2YRsOBLXXf591Ps2e4Q59UIJn00LlJ+/9CxRU5TkC6Oz/Cz5ZQybgN6oEI+yT2VlGfPPYal+oeiZ4ro/+P7FZVAe4CBuvyyK3ogwjvmeveq3pXAwf6MJo59dCTybB0Rk/5kA6//gHoWboweZf2RMBOZ8qwZf1WUp16n1bhLThWYbQMA57Y4d9v+IGcnT2lmLNZlZ3R0TAqMGppBkqaZzcoyz7qEY/YdbgWihm0gSbYulvvu9SpxZVXQM0TCHpfG5VpQKKlj2m4bfvPU2FuBEVcl+qwjXD2cP543D6Dymq1qUL0GaE9LO0N9h/PPRGVcRG11ADwxGcMqrSfN4+xjucRmc9WIumN6pW+ZMnUiWF8nO2lmtrJo48ofhWbeThZaxrtEKDD1ZglmFvgQUXjTroKfuO5hYsfqZdabQ9uvOWwaJwWcaTMGxjZ/NBrPo3D6/UCVa9jdTX7uzjDl92zu4YeMU62K2vJvOz6UpOM9aFaiZO9bVrFiWUo7fZR1ozmVIkkwjgLRNJdDgxfb9HV9Kj6UXH1/0YWbAuSyWqGTlzGA9dYJF6ifWaPP3zTnORuLX77J75oZ1qFdaZ9zxAu5RlXvsowppV0kEGExXosjIo/jlobNjuCXlY0+CeuYYpxzQT5fLPRvy/UeORk0EObBCcbFjfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(508600001)(4326008)(6486002)(966005)(6916009)(54906003)(8676002)(66476007)(66946007)(66556008)(316002)(36756003)(86362001)(31696002)(6512007)(31686004)(2906002)(26005)(6506007)(8936002)(5660300002)(2616005)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmR3dTFSM0tpZm9QWUdrTFZGMEpudFVlMWxXamJEREhVa1d1TEVqRkR3bG4x?=
 =?utf-8?B?b2dJTGRzOE1zNDB1TEVrRUlzaCs4OWExWE83YWFkTXZsUlo0dEQ1N08xNGNP?=
 =?utf-8?B?L3IramcrcTk3YXA4RTc1U1FNZkpGSWt5OTA5MmNaMUtyMlcwbi90NFAzNUdx?=
 =?utf-8?B?T3prVmlseW1VVEtXTXBNbTRlU1lsVWtJYlFqa2JBUG9JVXEwZVhTd1U5Y09C?=
 =?utf-8?B?UEJkVzg0bTRsS2hoc2xHdzNEYjZQdEd2T3dHSUZSZWFqcmJFcnJNMk44U2Zn?=
 =?utf-8?B?dk0rS29XQ0ZKQUxwei9TYlNiMUxBR1BzTWx2ZVo5S2VaeWZIL28vU0JJZHV0?=
 =?utf-8?B?SFl4cVpNeWR4eWlxTUVpTkJHeXdudEc1VzV0WTdnb2lodGQ3MHE4a1FmZExo?=
 =?utf-8?B?ckEyM0g0dXJqb29JMDlyejNCd2doekUzWXlTbUw1OUJTclZneFhPMWJGZzlL?=
 =?utf-8?B?V3haSUFvSWN1YldwV3JIMzhYdWNDY21LT2tzdTF3enNBVzRobFZhQ0tEd2l3?=
 =?utf-8?B?UmFaL0g2ZDJjVGJVcHFrc0QwQmhwWngwc1p5Y096b2dNaEFyUjZHUXR1TWdy?=
 =?utf-8?B?Ukg3eXhRd1J1QzhKRTVJWWluRkNxSG92Wm0xNERndHg3bWVSM0JuOXl2eThl?=
 =?utf-8?B?NUlWUWtzb1lYVndKU0ZPUnFIb0xQcnhRZXI4WTdTNnFHbXQwSjFFMDA1ejNE?=
 =?utf-8?B?WVgrdk9uK3psZUNpTDBmaGhSVENGbnBIc05HbjFyU2lxWWVvTFRkK3ZweFlt?=
 =?utf-8?B?cm5NREh4RVFCZnZmN09MaHFIclc2Zkg5WFVZdUtEaUVGNEQ2QXlQN3AxelF0?=
 =?utf-8?B?MWlYUnA5by9SanFadVJxQjIyd0N6S3dBc1JaMlR0VklxNjhjSkRUeXkwbjUw?=
 =?utf-8?B?ckJhN3UraUNEdkxFMUFRQzVKVUlVWFBTKzltTm0xd2FuL3RFTjcxOW1kalpP?=
 =?utf-8?B?SGRWQ1pzRUpQckxmVE1Wbll0a1BMaDZQVnc4OFMwT1RhdHdETU11cENrYWFw?=
 =?utf-8?B?bjJMdGNNdkVlUjhPSjYxUklqdmgyUTZabXRBclpvclhKT29JUGU4d2g4RHRD?=
 =?utf-8?B?K29nekdNeXh0NkxjZCt6T1JZS1kxMWVpLzlERDAxTjJWSGJvVkFZSnllNEtv?=
 =?utf-8?B?L1B0WVcyeUVNbjdZWGRQV0lJQk1sa0MvSXBlVXRnNjZVQUdqU0RlWDZvVktG?=
 =?utf-8?B?UXVMOVl2THhERHhTSFF6aTA1cUF0VjhXaDN0NEpTOWdGdHQ2MEg0L3JBYXRN?=
 =?utf-8?B?ZE5VbS91Z08zVytzeWNSYnlOOWpGZEdiaVZPNjNKQXR1UGhjcXNKTWgzY1Ix?=
 =?utf-8?B?WGN2eTdvRCs4WEs3bzF4c2x6VlJsbEErTHhONEZiNEpsK0dWcm40VzF0Z3Zw?=
 =?utf-8?B?aitjaUx2NlZrdXlTaGpYTHRsOEhTYURZVTdoVFI1SHVETStIeGtyVzNsa0I4?=
 =?utf-8?B?eWthblBOeWwrTjY1UGl1UGFma3pNWUVEa1FvNi84TDE4SHFIQk93OWU0OUlh?=
 =?utf-8?B?ZjhZRjJLb2VIZnplVCthbmliVEZlUmZzeThyRnY1cklWamxrUzd5d0paRS8x?=
 =?utf-8?B?YllEaGtQMXNmTkwrckVabVlTbU1xcitseGM3cmpOOW1aMEZjbU9UR2ZtaHN5?=
 =?utf-8?B?eXZTSnd3TjlkRkY4Y2xNaGRWdmw2NnJ2dGRDV0ZaY0twZWtyNWN0S3Fsd0U1?=
 =?utf-8?B?b1BsNk1FN0N2cUhEenlTMlI4VE5nbUdiV2xlclNJaFZMRnlsRmtvQUpRY3Zj?=
 =?utf-8?B?WldqTEtMYXBlbTh0aFZxVlBJeEJ5MUdybWRMVC9PbDZGQmVwbXhGbFFVZmVL?=
 =?utf-8?B?S0lQMjBwbFlrM3o5di9JSWZxSnRJRVpnQXJ6RzBuQ25MSmlSUlo3R2NpdnMv?=
 =?utf-8?B?R0c2SFpWM3lDeGdoQU5lY25HRVp3RGdkRWVOL3I1djhRYXhVU01DN0YvTTRJ?=
 =?utf-8?B?TlFEV0F4Y0dVc0JXZmE4SEpjL0NScHNwRW4yR1lVVE1XalBhazZiUXBRS2t3?=
 =?utf-8?B?clYvR3ZVSzViZWNBYmZOZWl0clRyNENoOHAyTWs1T21NN05ZbnZrYnFCdUpv?=
 =?utf-8?B?SW9Tdy9sUUx2RjI4Qlc5SndSYm9tUFA5akdmNjNlajRJcGlpWXlqeWFPYmFW?=
 =?utf-8?B?M3drNCtYd0dPNkRpSjE3elVDeEI4R0xXaHpJRzlYRXQ2bTZYUU5yd1lQMGg2?=
 =?utf-8?Q?HboFN3c8d47b/vvf/aaifDQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f1f6e9-a692-4fff-2e7f-08d9ed4deaeb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:01:56.0588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0NxGU6CGoZ12KolyMg5FMzfOsYNQrsLqnoBUIc0BdpT/pqEjJd1G6Er+3razcgrKU8TOk1Pdum9gV/Y3t+ZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2682

Gcc11 looks to have trouble with conditional expressions used with
vector operands: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104497.
Replace two instances causing SEGV there in certain cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.c
+++ b/tools/tests/x86_emulator/simd.c
@@ -1727,8 +1727,8 @@ int simd_test(void)
     if ( !eq(x - src, (alt + 1) / 2) ) return __LINE__;
 #endif
 
-    for ( i = 0; i < ELEM_COUNT; ++i )
-        y[i] = (i & 1 ? inv : src)[i];
+    for ( y = src, i = 1; i < ELEM_COUNT; i += 2 )
+        y[i] = inv[i];
 
 #ifdef select
 # ifdef UINT_SIZE
--- a/tools/tests/x86_emulator/simd-sg.c
+++ b/tools/tests/x86_emulator/simd-sg.c
@@ -282,7 +282,7 @@ int sg_test(void)
 # if ELEM_SIZE == IDX_SIZE
     y = gather(x, array, idx, (idx & inv) != 0, ELEM_SIZE);
     for ( i = 0; i < ITEM_COUNT; ++i )
-        if ( y[i] != ((i + 1) & (ITEM_COUNT - i) ? idx : inv)[i] + 1 )
+        if ( y[i] != ((i + 1) & (ITEM_COUNT - i) ? idx[i] : inv[i]) + 1 )
             return __LINE__;
     for ( ; i < ELEM_COUNT; ++i )
         if ( y[i] )


