Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOrgAN3kcWngMwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:50:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE386372E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210512.1522162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqOO-0006vK-6b; Thu, 22 Jan 2026 08:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210512.1522162; Thu, 22 Jan 2026 08:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqOO-0006sI-3G; Thu, 22 Jan 2026 08:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1210512;
 Thu, 22 Jan 2026 08:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viqON-0006sB-FC
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 08:50:15 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d77eade-f76f-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 09:50:14 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BLAPR03MB5652.namprd03.prod.outlook.com (2603:10b6:208:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 08:50:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 08:50:08 +0000
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
X-Inumbo-ID: 5d77eade-f76f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPy7EP3B2M9VsSUa0/L5/2J0hQeWLjb6qdaUlYlz78lBACO1gIQlqsweMmN7cs/zuKqNpTdca+U67Dq5O2YVBa+YJN9PJ+N6wL9oXTpphB8UiDqh4vlo39qHgsPKGqYZKs7u47wTSEInJFja17jwL6Q7WKOU+0h3j7cwW4SoWhQgnTr+T4eWxTAKI3u5G6scrWHbRDjVbUsPPM1FUXoguRmELg9GMBR0Efo+K8RtptQ1r7JF5n6KMdnk7GW/MgEw8rw6tD7HktdeC+12YYsfmLuPV2DwgUlQqM+u8vn95VquouLDB42hGcRyNrLx8rPydjEkEICUdCIhGuYr16yK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3iOoc/nuBc5WkLGONORTWrb2TgKuY7zFb0BolB3EXs=;
 b=XifPg48VbS+/QGBnFQ3+9WAuIibUUHcwYjfd618kkZdeM+7D9mLeZAK1yKqw7iJSVXzo9An2iC1JpMqVEae/ZzHSdfKnvR7HoW+HVwRJHFrgwmdXF82baxyuqcNTdgD3y0VqOMrmIJ3rpLg0wji/d2fW/YRnUzLeJsYzy9O5cUNQ9PmD+JsqoVCEziBRc2KK0MLtiRtR1QdfY7mtca4rO8N62wPfYuIF1I7UiWCdPBR7zLShxjGy+3c1qL4kxWkm1J5hmST6eoNiTdrBlKcJljBO4ZAZ/09t8G7f6kdhvX8J096IBJAndoYc5/VCB1ID8eGk8+utQCmVTRnHsaxVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3iOoc/nuBc5WkLGONORTWrb2TgKuY7zFb0BolB3EXs=;
 b=qeYqqPhUsJOLhL14hh4UClLQbe4o+WsG26pwoLpq3zDCYWXyskgbwGXDsSxZofmoX9PUbdnJu5KBvnOnADRGbuLSyNM/iFaD1i5a/VHSAh75iVeEpUPxVV/WmpqiBOXJ1JIOE15d+B2biS3OnEKyNrbCmWtX3CjMDrMqzoTeU98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 09:50:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 3/8] x86/HPET: move legacy tick IRQ count adjustment
Message-ID: <aXHkvZaxl5E0QL0F@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <f8ccb446-44e5-4939-91f7-ac17f660f56d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8ccb446-44e5-4939-91f7-ac17f660f56d@suse.com>
X-ClientProxiedBy: MA3P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BLAPR03MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: bf196b5d-be88-4717-5df4-08de59933f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjVtUFNtS2hUVjVNWkdSVEhKWkw3d1lBU0dZd2lYL0RwUDM5YWZmc2UwNFM4?=
 =?utf-8?B?YnB1aVYvWXJrMnlrdFU3VU1SVG5sY3B6MWh1d2svZjJMalN3QUpMeVYrK0w2?=
 =?utf-8?B?Z1J0MEFBbnZhQnduRE1Hdnh4cnNWNmdPTDhCOHNTcm1WQTRvU0gvTlFaZTYw?=
 =?utf-8?B?bU4wbUZSMG5xc0ZraW5Ob0toRCtZeEdzSVRXM1ROVGQvTWpkT3JVVzJlQTVB?=
 =?utf-8?B?V0ZieVZ6SllRdjlXNk1XVk9QMFVQQUhxb2JsZEt2THA1cUpTSzFVNUo2QW02?=
 =?utf-8?B?akJ1eTNtOFFXQlVnOVQwdlRmRXhYZTI1UUo1azJJQjNjV2g4djFRa2t6Ums4?=
 =?utf-8?B?NVN3NFFMeFczbE5VbkQvRGg4V0s4NWdsL2ZjblA5djBCSTBFVjhob2M3UWRx?=
 =?utf-8?B?STlMTGZnbm9UZmVJVU1oem5CQTJSU3NEVzJzd3NPcHJ0RFI2ZWZJMS9ETFlV?=
 =?utf-8?B?RVdaS2MxajBURzY4ekhwYXRjR3o5VzJYVzdsZ0pXd2FweHNmRGhUeTVqRnlW?=
 =?utf-8?B?bDdYb0ZDblB2Z1VlREZrQnBjOGwxeCt1L0xaRFRxdGxRQWJBdEJjSTBuQWdR?=
 =?utf-8?B?bnJ1T0JWNzN1Njd6RmZzZ0FvbVRpV21KVVdTcFJHSmhYODJkUFhkQ3pHbldO?=
 =?utf-8?B?Q1RXdHBnSjZwRjhTWGh2aldyT1ZwQndnQWNNYWVFMTRmSjhVbmhRcy9ZbDVU?=
 =?utf-8?B?TTJHbmNOdHhLMlBnVW4xQVBibkZ3MUNINlBrMnNVY1E2M1NHVEtmNEVRYSs3?=
 =?utf-8?B?U1dZamVDaGtOTlJGUm9zRGJpRHVRQlRCMVRJK0Z1T0d5ZWdjVW0rV3U4bTR4?=
 =?utf-8?B?OWVJcGFoUXdqN1RJSGlnVEdWekN0RVIyUHJQYjV3R2hCM0pIYWJpVzl6UWV5?=
 =?utf-8?B?Vm9FVTgyWDFYZVZiNGhISkJvbTRFVWtSaERhZ01BYU5VdDVNaXJiSHBoaDZy?=
 =?utf-8?B?Vmg1Tk5JOXJFTkY1Sll1czBlaDFrRVY5OGhoaE9qTzhSVGxrbU5USGd1MUF5?=
 =?utf-8?B?T3gvQmJXS2VMYUFZOVZBWVFmSStFKzVzRGpTOHAzd0dXNGV6WGh5czkrd04x?=
 =?utf-8?B?MHM4TDZMc2QybzBTK3RnaDZDbjZiZ3h1U1VVYkRlWUl6Q2JXSHJMemJYNHF0?=
 =?utf-8?B?U3RLenlFelBONkMzcVBQUTNMeHliUHZBbUpJNTJmNUVuSjlhMnNWclYwWGlY?=
 =?utf-8?B?Um1hSHV3MDNTYkxrUGdwSjd0V252VjdRTFcxUUFselZac3FJaUFoZExhY08z?=
 =?utf-8?B?c21SMEZLTktRcWtSWXBwdjhsKzNmcXVocE9JVGF3R1JMVGZmaGxpR1pEd2E1?=
 =?utf-8?B?WmJDYk51MWdiK2cvK0VVcllWZE5xVnZmQmY1eEtNMVVJWk5tS2g1SVVSc21O?=
 =?utf-8?B?dGtsak02SzlmNy9zK0N2STVuZi80VDlvV1AzM3E1YkRrdmw1aTh2dDlwRGdK?=
 =?utf-8?B?bTh4RlQ1NnlaUTZ0VUViTUxWRUMxbjdMNVpScXVUTW5kYTltWnNRcGVPelVv?=
 =?utf-8?B?bUROOXFCZ2M5SFNib0JqMldlVndBaWpCS2Z2Zlorc0tkOUdvUXdDSEh3N1Jj?=
 =?utf-8?B?Mi9FRDhiV3UyMmtnSklOR3VESkVsMklrQ0JtRXRyYmtkTnhmSkxYVUQrUjAw?=
 =?utf-8?B?Tm9tQmt5QnFwWk9yMmNzMWdwUnJ6cThmT3lJeTI0ci96Lzkrak1kWVM0SkRy?=
 =?utf-8?B?SHRtUkVaYWRUQWdwRVIyUnArNVlLc0J1WERyd0NnNEN4ZGNPa083ZTlwa21m?=
 =?utf-8?B?ZHo5T0hiTFA1V3hNL0FUeUlKZDBqT2RIVEN6Sk1jb2RpY1h6eDZ4NVVyS1NN?=
 =?utf-8?B?cVAvT2o2VmM5ZDk1N0RZa0lvNldseVlWZkxlNHRlZDZRM0dlMFI1cHkxeXlL?=
 =?utf-8?B?UG1kN09LRUpMMW0xczk2ejEvVlMrMHpPTHB4QSt5TkRxWFFpdmZ3QUMxbU9r?=
 =?utf-8?B?VmlGdStYeG9IVGdmaW9TOXAxTzR4ajF3R0R4WnNnYUFDMWxpMGxqRjZiSzRy?=
 =?utf-8?B?RjNBbGhGSlFhZG9jZjAyMytQcXZDYTFoUk0xVWJQdkJuTFVpLzJBb3lGR1lQ?=
 =?utf-8?B?VU9NSU55Qk1NWkI4bDdBcEVXTlh5a3JZWklNbFhlaWJ0VWJueU1DbnpyQWJ0?=
 =?utf-8?Q?lpgs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjFvdnQwMW5yZnhlQldzZC9MK1lQZXVDeGVOM1h4YnpqenhWODU3bFd6Q0hY?=
 =?utf-8?B?UHlnUnRZdzBneWhsdlEvemxueGNiR2FXMWRwSGpPNHJhRXRSU0puSDhPSWlE?=
 =?utf-8?B?SUNtQ0FsOXVJSm05Zis1ZHNzNXE3Z21tZUxPRlAvSld0SzkxU2g1M0lMbVFl?=
 =?utf-8?B?RWIwWmsvVTBnK0dqWmFnUXRhS256czNSaHZMejl2MjZkanZSRnc0WjdvQlFZ?=
 =?utf-8?B?SUZJL0xKeVJiUy80VGcwdUFHeEc1WlplMW16WW5naWc5NUNsMWhXQW45RWNp?=
 =?utf-8?B?azEzRHFWM2VncTl0REI1L2pvVFV5T1BGdWZVRUF2L3VJMjZMRlZzeEJ0bC9X?=
 =?utf-8?B?NGR1RzVibzlRR3NXZnZSckdjYXRPdUZNa3M1YnJJQStEZ1VleFhIa3l0Qk92?=
 =?utf-8?B?cjIxRFc1b0hjNUZ5VTY2Z2J6UkRNVHBSTldsZFhqcTY1RTNObXZuVDRwUHVx?=
 =?utf-8?B?UVFCK0dRbjFqQnNiWmpzV1BvNCtOQWJJOWtXc3U4cGpWbkdHclp4REU2NmVJ?=
 =?utf-8?B?eDR4dTQ2bTFQQlNucVV6WllvTVVDTXFuQklsSTQrODJkMWcrOENkQ2F1Zjc2?=
 =?utf-8?B?dm11RUhUMUlNRDM3YnRxdk52TGNkM1FaVEJ6dUdsNjM0c2hLalNFdmNVT3NI?=
 =?utf-8?B?bkQzbVRwTHpOanh3cmhZNjdsU0N3Z0ZiSEJaVXN6NlhBWDFjRDlLOU44NGhu?=
 =?utf-8?B?bXAwdmZMY2NraTJYaUk1TmFhZGxXb2gwRitwQis4Qy9LRDZNekx0ZEhmdS9z?=
 =?utf-8?B?VlRtSEt4SSthZ25Wa09jYXdNRnc1cmU5MEUrK3RrYWt1Zm9lNWlvRGxKcnpI?=
 =?utf-8?B?TGliRjVzcFAweHFSMmpDeGQ2OCtGTE00aEk2VzI5MFFVa2g5UTM3TXhXNVNx?=
 =?utf-8?B?OVYxN0F1YTRob1Bsb3RDVG1qL21RQVR4MFlYWlg3VkJVY0t3NkFHbHV6ZDYz?=
 =?utf-8?B?Z0NaRUZZUWJUd0VqdElRM0M5Ny9Hc2FqYWg5RTNVR25aOTdSTjBsZXF5RUtJ?=
 =?utf-8?B?dHRkWW9yQldMcTA5OW5TZFZmWWlCQnhEU0NLdHVmMVNLajhRYVdqZ0YvTzRs?=
 =?utf-8?B?WW1IZllxaVNpRGs0eUY3MnBvcHA3NndaRkE5QlYzMk91MitlTHk5dis0T25m?=
 =?utf-8?B?NFNpcURJaXFoL0xMN05HYU9jWXdLVGs1MTRNLzV6ejBoKzFEN3Z2ZlcxSFJV?=
 =?utf-8?B?WnN1ZE0za2cxMURJZGcrOGxhZDR1SlNvMHJDcU1lbW9keE1Gci9kcEg4WVVB?=
 =?utf-8?B?RzI3UjJrZ2NQWkQ0UlhVOHNLVWJLUXIvMEs5NGlXUVdDTEwvdzJkY2xrb2J4?=
 =?utf-8?B?Kzg5OUpHWm45eURUVjM3UStnV1huQmxOQ0w4Q2ZmbnNzai9zL3JSNy9SSUtl?=
 =?utf-8?B?VjdnVVRwYzRtR0RoOUMycFFtY29iOTFJb254TTMvZVRQejBFcDhYVDJLOVVy?=
 =?utf-8?B?UnNjL2R0TGVlcklHdXBXTVNqMVV1L0RScHljNHdOMGpRckprUVFKcGpoVE9K?=
 =?utf-8?B?d3N6cjhhL0FhbHVFR0J6cnpaaGJUYW5LNytCZzdxVkg4M3IxQ24yRmdsbGJB?=
 =?utf-8?B?VW4xUEE0VjhhelI5WmZzNHFNZmt6ZnZnWFhScjcxalhHYkFWNkl4bGg4dmdQ?=
 =?utf-8?B?cXdMNzlFSlg4d3UwWVZDN3plcnN4RkpHdG5vSU5CbUpOZm0wNzAvK2pzUEJZ?=
 =?utf-8?B?RXFSVEo1UGlFVnI4SjI0TjB2T1ZCRGZtSnhVdUYwWUdEYjhCRWUzNEJBaTdF?=
 =?utf-8?B?LzExamJCTS9tcTU0Z056djdNdW5CUEF5b0IvRjROUTQyUUZuRHgwdGJNZkJp?=
 =?utf-8?B?ZytBK0ZmZDZIb0lNck9EL3lDbzkrY1lmM2xkb0d3TlZsTEI5QXRiakVCZlVP?=
 =?utf-8?B?TEZrOE1OM2tmbkRjR2FyaFpvOUhyVms2MHZqNlU3TmJpN3doSjN5YUYxNFRL?=
 =?utf-8?B?Znp5SVNUelVBMG5qc3Z5eDZxb2dEUnlPa0V0WlcrbnczUUhqR2tiSGxIRzNH?=
 =?utf-8?B?a2gyV1Q4UjFDMUo0OGhIWjBwcDhEU0Z5RDM0Z1lsWlV6cWg0WHBsQUJYbzBv?=
 =?utf-8?B?aEhTSm1SVlJCMGJodDZLRC93bCt1cGp1ais1c1RKTmpDL3BxbGZCSkJBN3JU?=
 =?utf-8?B?Yk9ERzZsSEZNbkJXYlhWZ2c0cFg3cVpYV2VLT3BxRkEyT2FJdVNOL0N5S1JL?=
 =?utf-8?B?b0hjWWxCbG8zb3pyYmpFM1J0QmhGNmh3VE53TDlqVDJoVyszNUM0ek5ZSGRE?=
 =?utf-8?B?alFCaStqUktsMzJwQWsyNy8rVUU4ckZ6MTltYlZVMWtiTFl3TE0yaFZJcGRz?=
 =?utf-8?B?RWdEVk5XRk16aXN3ay9Lalp4MGdJNU9SaWRHSW1QT2JrV1lnVVlRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf196b5d-be88-4717-5df4-08de59933f17
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:50:08.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggz3vXJcdLSpXsD2c/+FWCyZZqK3CVpQsE0B7kqK5HUKkn1qPaf3YZVZ8KOI+XT70dD433PsdUsWp4DbP3nUIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5652
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5BE386372E
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:37:45PM +0100, Jan Beulich wrote:
> If already we play with the IRQ count, we should do so only if we actually
> "consume" the interrupt; normal timer IRQs should not have any adjustment
> done.
> 
> Fixes: 353533232730 ("cpuidle: fix the menu governor to enhance IO performance")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> _Why_ we do these adjustments (also elsewhere) I don't really know.

I think I have an idea of what's going on here.  This accounting is
used by the idle governor to decide when to go idle.  On Linux (where
the code is imported from) the governor took into account the inflight
IO request state.  However that's not available to Xen and instead
they decided to mimic the tracking of the IO activity by counting
interrupts.  I bet then realized the timer interrupt would "skew"
those results and make it look like there's IO activity when the
system is otherwise mostly idle.

> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -808,13 +808,13 @@ int hpet_broadcast_is_available(void)
>  
>  int hpet_legacy_irq_tick(void)
>  {
> -    this_cpu(irq_count)--;

I think you want to pull this decrease into timer_interrupt() itself,
so it does the decrease unconditionally of whether the interrupt is a
legacy HPET one or from the PIT?

By gating the decrease on the interrupt having been originated from
the HPET you completely avoid the decrease in the PIT case AFAICT.

> -
>      if ( !hpet_events ||
>           (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
>           HPET_EVT_LEGACY )
>          return 0;
>  
> +    this_cpu(irq_count)--;

Also in hpet_interrupt_handler() we might consider only doing the
decrease after we ensure it's not a spurious interrupt?  We don't seem
to decrease irq_count for spurious interrupts elsewhere.

Thanks, Roger.

