Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEFBBD33F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 09:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137852.1473685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5fWH-00061l-06; Mon, 06 Oct 2025 07:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137852.1473685; Mon, 06 Oct 2025 07:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5fWG-0005ye-TU; Mon, 06 Oct 2025 07:20:28 +0000
Received: by outflank-mailman (input) for mailman id 1137852;
 Mon, 06 Oct 2025 07:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zDhh=4P=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1v5fWF-0005yY-7x
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 07:20:27 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea797a02-a284-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 09:20:20 +0200 (CEST)
Received: from AM0PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:208:ac::17)
 by AS2PR08MB9740.eurprd08.prod.outlook.com (2603:10a6:20b:604::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 07:20:12 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::96) by AM0PR07CA0004.outlook.office365.com
 (2603:10a6:208:ac::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Mon, 6
 Oct 2025 07:20:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 07:20:11 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by FRZPR08MB10951.eurprd08.prod.outlook.com (2603:10a6:d10:136::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 07:19:35 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 07:19:35 +0000
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
X-Inumbo-ID: ea797a02-a284-11f0-9809-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RDpvyTSlufsaV86qV9JwykHoQcG0MSlWzvCBebpw1tyPeKcEPLMC1ZlBwdrEhRmoL3+0ejpv24OVGMhA5ZW0OnQglYJJAVBwVBkg8luBCbRvPONgzMKqiL+Hy2vbQk+BUkYDGecoSVgiobNut1BVBGX24r33S9qmAlV+8vFkCKIHKh1MyMopIygqdU2NwJbT3FAhri9gcjxF/VSOAERlxPwloLC6dfscbRyz8HI2SbM6s61t3uR+IrqktDhJzepmvRAivNTX2spST7QUUp/LrVz+eaF0Kx7Kjg+fitXi3z1KYnrp4nP2MIbaeUoRtRxSMfYg3MiCn362uh5vVhZjBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0ND/d7eQYFHw6AQoAkVccHtBQUytZ1ujf/jgUpuCXM=;
 b=dmOKGxBevPgztBemJY/lR+abpgkG4lN2CJFWDcHI//KWItcXHZK5RYGu8/ZiYeg8x6Nobq/N04vfFc+J0ElTMOd6rulk62yKfIa5ushEWsIqTTSLJo3wdqa3sHW+nhW296+oV05vEtpqsRMRDF4umLL8GWQQmEUXwHPEejwESUMYCv+3ET5g+oja1ewXT4RuSaxiwTdMV/1JqEACC8/UdKtYyhJ0n9mD5mbH4Uwa31Js+0uCW7MSMabHaxVVKomFrOSeXOeQ2Ug7Q4y6c6A/21iUuP5sw9BRwyK0q/sod6w1HpPTH2wsY26RU2mYryDlP5g9qKZfFDZrqCwmQsTXxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0ND/d7eQYFHw6AQoAkVccHtBQUytZ1ujf/jgUpuCXM=;
 b=Q5yObx8flEjQ+4q0h5gsaddNI3KuI6Uol90RFhG1Crq9AXVAIUCm8AcBMbMnKbDxQJ3ekY9v0ZokOpmg1TY8sVuZ74XH0Qbffhb0RVADTcaxG8mOFeWkay+co3dB+31Qi+ufOy8xvOcooWfrPjocIUPXX/bAZs/TsL0b2g1wI8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOTLx1vqQOBAHaMf6poLSQsZT0ACj/3azLlTbXdIzVYUK4w9oZZwQy8lgSabPVVZFq5WpB1ezwLtzAGWgqDL88o3P+5XobfYqJixGbBals8V3FCous6aL+ynACriciu1x8Vc9MR2i2dQX0xmB6zXvdK4614YR+7J4gbKQeZO6Pt3Ky/IO1lQH9xpr5IKGJ5udqDOsgoGfG/UHLoZ9WtuSQIWKLLpw1cHvMmYvdnV6Oih/P4qpIjkhdWUDbbjuUIBLoJDe5GQWEwDdQLyEgA60Tk2WLG/H66gOEKAUW4O33NMSK3Aze5Lu7L1mtIf2MSlbUV5+0LVLhocSd4tds+9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0ND/d7eQYFHw6AQoAkVccHtBQUytZ1ujf/jgUpuCXM=;
 b=WUaMzeKgtR9BStT3lOsxKSTU+6ELmLJIHOJUGm70aqxEl/xlT55lIv0ypCHMfcKRgwwtlY5Fbv0AbXfipQMXWhqeXclWAInFNABRfMae4I5pT/qe5QAoYPugSy+RNbDqIZ9MXhIBUfZzQGxkiog+Sd0Xwcpu73q0+3J3WhGaVb/VZD97y1xEqCUgq8NIABmbLP8MTmP1embuSxMbNPCR9qIjI/ofwo/cSYDXKPQ2wXiJV7mqDIrLynsb3ahs5alk3Na15s4iH/ZGgyg99hchSsSO6ro9bAOETA8brKzRydizjeAUHCHMqVDZ0RMPP/niESuPd/dNJG1PIOCt0+1LDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0ND/d7eQYFHw6AQoAkVccHtBQUytZ1ujf/jgUpuCXM=;
 b=Q5yObx8flEjQ+4q0h5gsaddNI3KuI6Uol90RFhG1Crq9AXVAIUCm8AcBMbMnKbDxQJ3ekY9v0ZokOpmg1TY8sVuZ74XH0Qbffhb0RVADTcaxG8mOFeWkay+co3dB+31Qi+ufOy8xvOcooWfrPjocIUPXX/bAZs/TsL0b2g1wI8o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] libs/guest: don't use unsigned long as type for PFNs
Thread-Topic: [PATCH v2] libs/guest: don't use unsigned long as type for PFNs
Thread-Index: AQHcNoZt7mla/rsydU2n7oA1r/gbYLS0tfGA
Date: Mon, 6 Oct 2025 07:19:35 +0000
Message-ID: <B5C488DF-BFE9-47D2-A385-5B52A89B1ED3@arm.com>
References: <20251006055939.27286-1-jgross@suse.com>
In-Reply-To: <20251006055939.27286-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|FRZPR08MB10951:EE_|AMS1EPF0000004E:EE_|AS2PR08MB9740:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad04d2-dc4f-4ade-a453-08de04a8c9bb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5FDE6LmgBgJAqBO+hriF8/+5+9/ikShvcKMGH5x4agLs5jlYEcYV/inh4hBp?=
 =?us-ascii?Q?ZB9J4T6/BW5gblOKCSn0fiXlOWpY3NFyO1XYcwOynCnTgRTCTFbvnYn/v2yS?=
 =?us-ascii?Q?FPHNTsjSvd7+Q+T/UJR+3Cu4i7MLiYfyivTxtUbrdQ1/6cegOJwtG+dNcscS?=
 =?us-ascii?Q?lRCSBXhQnN+tmf704bsrLBCrBQfHJIjAq1aVDb9Gm+LtEVb0bqp1+IIK7rz+?=
 =?us-ascii?Q?oBg4lV6TNN+Pt4Y68k5++xdxjR5qvR2TTHsEzuC0cC4SZvNKDAnZdaIBqB9X?=
 =?us-ascii?Q?L5mVKssP7rHHQFqhzx8t9xgWrVHUbvct6sTXXkGze85zxPHzaJBCBsy15Am2?=
 =?us-ascii?Q?g+ah9jJLesaTbNcjZcjU0THy8xfxiGmhmig5FLXrrYbYz3pFwni1AmXbyPE/?=
 =?us-ascii?Q?HEKDokj5jb/nJLU0jLc6ikXYVZWCW3K2/KrOL2nRlAi+vl8r0614KINl8V+x?=
 =?us-ascii?Q?9A/4CtqgCB3FyjgLfnmT9diVEheVr+tRx6+kl8UdPcwfKtxNZozOGV1jIyuP?=
 =?us-ascii?Q?7toxq0IdtgH2NYKmy3aLcMvmwcz+WhNLFojRLLSHg4G7M/osSVeYrNSynSZO?=
 =?us-ascii?Q?lml6YEJcHHKIod1pVoftEAn8nptBhT2OcvqpTkT91yHrrT1CoCfMO9WMOx+O?=
 =?us-ascii?Q?evxmx9kAyGaCZAkZgWnGcpWFxf6TtSeRAuoTdSznjhnvedccKrjNk++LsLgv?=
 =?us-ascii?Q?3jLbn6sUwwTt6sH564OHcxVtI0i5lsGcgmKYOuqKxWC1VYBrCp5MppbT6xyE?=
 =?us-ascii?Q?RPAuaLbgCl1wnPJsS/k9ukj92w7dqji7mLkP76jiJdTbtLt6xHArWOkk6Dmn?=
 =?us-ascii?Q?iAZKuidh1XsaoRWc3xK4bH2+qpXBHAVio0oc/LhurZT+okecy6hG9E1/Fo4i?=
 =?us-ascii?Q?g/65L8ZFhuwU8yyD4/71usPJ55Cd9Da105xEi4SNYSrSd0GhczCbOyeBMzSN?=
 =?us-ascii?Q?q5ykugpgwZsgcKoWBNDCHz+TiPwTxHpayzwknUYE/7aKO11xuKhsm9ifAvWo?=
 =?us-ascii?Q?Xnm46s4sjBoYeo8voEXhRrVQya8sXxNHaZZKveuY7AP/3E0VKfLCUn88LAAh?=
 =?us-ascii?Q?IA+x3DJZs+X1KOk4nhZ+jYkG/KtK9GbJEDFa7rUwKRPatcJU50BMb8xCi6fn?=
 =?us-ascii?Q?omFHqIrZ4qeVlWZ3hhra0L6Jf2eq12O1W/b0kPI6ZpKtQyqGxgUL3fcIHuHh?=
 =?us-ascii?Q?d/444Y+qwls6Z50wCy8akfe4i7PCE0pBxzZ7WOgjgqK3pGU47YRayCubBaWx?=
 =?us-ascii?Q?nc7SnihImeTnEK4TeBhHLCyZ1sL+VTlVx40hBUHSwQ/WQx55i7B+8kBwSnbk?=
 =?us-ascii?Q?w3kyT2fStIkM2tplEMG5V+0I84kOKt5XydLRz/HD7oHoErknlg6xXU+SFhXk?=
 =?us-ascii?Q?tj6TPJbCKvrzu2YdwLN61dHASy8kcc3YFvj2I+O33T+rc56S/i1tNQ1lt1nf?=
 =?us-ascii?Q?64CkChe8QBNogZnO5/ZPE4e74+SQo4zwfB/5cnnA++U1oSB9SstIvniZuKP2?=
 =?us-ascii?Q?zi1Q7r92okpW4RI149JYQtYKTEaM99W4b4rL?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C59FBA4A20DFF44A7553391F711BF6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	442953a2-a2aa-4cc8-255f-08de04a8b408
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W6vybqenNR4yYnd5OakJ+rWB9wFASrcZXBaZ15/hg6dd9hMBDh4FGbBnahoT?=
 =?us-ascii?Q?jgN3f/oxykrNX2GGqp024Rzk6tUKGLY8O+rTRWJF3YP2WCsWnQ+ePqzB/aPV?=
 =?us-ascii?Q?8Lt3Lj70gHQSw7XgzxWfET5sx3PzLOwj/Ro9OJM3Pi6X5OkNRQcpXtChyzzu?=
 =?us-ascii?Q?3d/N6wZMnVrL/eiKnMEy4M8r/a51yMAIUPtvoMQdcQ/KMZQRCRQoFqV9JJpl?=
 =?us-ascii?Q?9jRBmQ/3kI8AStyGlJlBSkusXY+RPqT0Kh6jjnsVq3uwzgElc66Che3AKZMm?=
 =?us-ascii?Q?Lna3RMgdVWUu+WVuT3t8f5rbMSizl8Fm2L2QvXaxtjS5/E89+L1u6R4FzPh6?=
 =?us-ascii?Q?NY9BFTcVy5kYEt7dsfJAayxBO1TFwPBiZTWiNd/tnLysT1wveeGjbOQ9Whqz?=
 =?us-ascii?Q?k7eUh4P94lMi1/qKs5cQDOgwROHoiko1//7QaoTI4jmXv0SBkCbt0z2Udm1E?=
 =?us-ascii?Q?eQPCwPZEXxDm4VmppHtCfcq9GovOrtcRztL1z3hE8/ToN9zn7//DzDFva0KC?=
 =?us-ascii?Q?xCEefWMT2HJDWpZUyFLrEJy+hifZmqJ4IbG4gSTDJd6WNLxCy8e+LEfyrmq5?=
 =?us-ascii?Q?qLst9b1TymPi23PFyBkiuhhdmHP/OlvOxXfYtM6bcxiCBGpGrBcyBD1dwLxn?=
 =?us-ascii?Q?DKWGzK7aF1h9PPob4Xm+3BpRXempwRGliBIBZFo5zYsRUsB3TO5wh5FzD0R/?=
 =?us-ascii?Q?kIKUAQoPqKpsbCTv09yuA/ijSdlZe8sCkS70I9rRPOyYBQbSSxihEkiVU1m0?=
 =?us-ascii?Q?/jANcpQjpgp5QwLeSMsmGjWg8vLeh1j568P2fMtdUNVlCcq8/CRGMcBB9fry?=
 =?us-ascii?Q?GdMJ0amxG4VFjgDPhSPe0iuTe8qmm8pJiWV6IaCL/XV8OQmqVcakCl+i/9vN?=
 =?us-ascii?Q?dnVugGzQgULaOKMfJfrnc+k2cWIUWgycfmajc9LwW4fBfkV5qSwVGM2JJPaZ?=
 =?us-ascii?Q?zobvSsLCJRYrwcgNP7OwTgzTDkRBwkHzmXWMdMJPOsGONBLd968qlA3+fX+C?=
 =?us-ascii?Q?EtlZ5Ei/xCxMZpXhOkzwISQbJMhEEAgY7XIDa8QVu+Z7kSF2a9wunahCsPai?=
 =?us-ascii?Q?Fo8pbPdUpgcvAapMvMsGVcKRpBB7N/xeVymC2SrBtw+Bv6yDsZJg3iV8rmq+?=
 =?us-ascii?Q?uyAoyqbiZuyU/JMeY9i0hAeXba5wLs4po9mTsxZfRcGnnPZMNo/gnIokG92z?=
 =?us-ascii?Q?48C0N2Cvpupu/HWebrHUK4SqbBbp/qfYFWPVhTUKh1SzpOe0P0RhR1PhpsBd?=
 =?us-ascii?Q?XtAY13YJYm06tJqrNAXI9yopf5+2b0cyMPb/InkwGvX4c7tlv+601oKTyBw8?=
 =?us-ascii?Q?AwIfARO/hdvOAo/beeb0uGHz7iz4jhicKz1/zoKXBoMeRAcYFnRTXBAbGJCb?=
 =?us-ascii?Q?0vG0t5Fxw4yxTv/16Kat8fSuA7oC/KaD5iPabS6Ivh10e35jK5SS3C7h9Khf?=
 =?us-ascii?Q?21fJAxiN3A/uuaE/hyHsx/CA0pqzXapeCxpdfkA7zN7E8Ik14B3zx4k7G2i7?=
 =?us-ascii?Q?ihLgkfkZMIddVd2QS9bZJdGwgTOYsnZUOfJB34u2aoGPSVup6gZB3RxD81ZB?=
 =?us-ascii?Q?UuoytYFvnNPzRuSUQ60=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 07:20:11.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad04d2-dc4f-4ade-a453-08de04a8c9bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9740

Hi Juergen,

> On 6 Oct 2025, at 06:59, Juergen Gross <jgross@suse.com> wrote:
>=20
> Declarations of xc_dom_console_init() and
> xc_dom_console_set_disconnected() in libxenguest.h don't match their
> implementation in the library.
>=20
> Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long.
>=20
> Use xen_pfn_t for GFNs in the library to fix that. At the same time
> change the parameter name of the implementation to console_gfn,
> matching the interface declaration in the header and reality (it is
> a GFN, not a PFN).
>=20
> Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
> Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - switch parameter name as well (Andrew Cooper)
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

