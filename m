Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A6C8934E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 11:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172474.1497538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCWj-0001sx-RW; Wed, 26 Nov 2025 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172474.1497538; Wed, 26 Nov 2025 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCWj-0001pt-Op; Wed, 26 Nov 2025 10:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1172474;
 Wed, 26 Nov 2025 10:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqHT=6C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOCWi-0001pn-OJ
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 10:13:32 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f61a304-cab0-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 11:13:31 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7626.eurprd03.prod.outlook.com (2603:10a6:10:2bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 10:13:28 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:13:28 +0000
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
X-Inumbo-ID: 8f61a304-cab0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpRXcXx02YFnNQU6xBApi5zx3IvMc9sTZnPzuZ99uQO2QSuXFBcVfJJhVzHsNasTp0vOhYDYO6T6/VIs5Cc7t7F7xiT6CJCizszT9KeSJ3kBxClzzy/MFB6KJxjn7j9yHDXWPO86509dlK1ytD/kvXNRwszV7bOB5/KYJsdmqmB1xhpFHKNdwD8Ztdes1CB8KbcOorMNE965u2rQ1/Rf7P0xpMKoVOvWOBLSG2YErPHzWiKsstPPLTiKT+YzwL/7SwiDKUsAsPvkTKvfHF4Z04MjPXtzzbFRRGSlA+xhY1yq7526sbQc6ux05spLeMz+vYtnMFgaE2NY/awnJOmGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeTzvXON8jlwjV7l3O0H4hbOXk8aCtEmPSffh71G754=;
 b=edX3Rstrs0A7g9ep4Lw0qAsEo3uZXg8DDHycGNlSqWgq7nujs1NIMQWvf79Xh6Mw3zEWcJmFp103SZH8Epb7/BQaL/2882mrODTX57YsXUzixImWsoyYolCWVCMLyfjklYGZcL+3Afvyyhka3UFzGFSMc57nyQZHHQUHTVPr1Q20uAfvaamYzN6NOyc33p5XiEhoIYSsRv/xLpzDDQINAzuYfsD5XTiW6ksNZRweSxrWw+rO245t9q1ucgYkADA9+cxjo0613J4SQrC6ZjOpla3Xt6Sz8u93RGTvox3lfAO4g+/9+6WYqYp/fyQWCvs9GwOhBr8KkugTLaOW20tNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeTzvXON8jlwjV7l3O0H4hbOXk8aCtEmPSffh71G754=;
 b=AGt/rDQr5iHXi+rGERBVVE9FG1fdXZQohfN7z/dBTK7ziwys0OtJ1dlnke97dcHPUwRVtgHRL+/0ulmS7kfeBvjvf+RO68JvP1SApDVBPmV7CYB9XyHxPQItrLO9/Nox4Lteo18IcOSx0NdxemfX0kGuxyZrOjLzld1pvs0JTsaZidB7KGZoENNwv409SRXSD3H6l6u8uRMmyWCD7V7jAJ9uE7icLTzxToWtYSGO69rPV/K9xMmqIL8t2fhyIZX4liclobDu7p66mOTEfdpS47CDoS6OJ/IG0IsGASdoB+DKop3EmkPe1UyQVZ9Hli8SFAtVfvmFUKrdMDlqYY8n1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dbee8b1c-5914-4b0e-886e-b7dbf579b1be@epam.com>
Date: Wed, 26 Nov 2025 12:13:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move save/restore under HVM_SAVE_RESTORE
 config
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251125230040.3070954-1-grygorii_strashko@epam.com>
 <f349a91b-89bc-4489-aff2-2590b521621d@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f349a91b-89bc-4489-aff2-2590b521621d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DB9PR03MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6d81ab-2db5-479f-c102-08de2cd47173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWdmclgyc1ZvY1dCZzBUTC9UcUVKZVlBSi9JYUtDdzhTY0ZxZ3l2T2lUTE1j?=
 =?utf-8?B?RjduWGJSMHIxT1lYa2EvNjJpK2lidU00S2ZWMTJ2c0xKdU1nV2RuRkhaZTBI?=
 =?utf-8?B?TnFKRzFDT3ZvazZrcnY3SlUvbThZV2hrU1UxMVlXY0pXYzN1ejUwSEFMcndq?=
 =?utf-8?B?WU5pNyszdlY3b0s1NFcxTzV3Um5ZZTFPTGZCK0VNYkNQdldqUXN1MFRMN2Vh?=
 =?utf-8?B?WDM2Ti9DVkduOGZ5bFFCOHN3ZXdCSHBLNHA1a0YxTVVXQU84dHFWS3Z0Zys0?=
 =?utf-8?B?YVplSTUzTHdVODFMK2l6eW9obXV6aHZMaFhsajJ6dm0xNGliQlhDeVZBMXhj?=
 =?utf-8?B?SXNkRUJqemFmQVBtalJ2RGtaeTBGcTV1Z2krN05vSmQ1eW5jVk5odm1odVQ2?=
 =?utf-8?B?eUpNNk9qaTFhU2wvekFYWVlFV2dUWHpkRXdoK0xZVGJ0TFplUWlZUzhRSmZR?=
 =?utf-8?B?NjFhRVVDNVRkVFFyZ0NWbXZqVXVmK2JtL0tCR1pBdDdOWEE0N29Uc0YxMlI4?=
 =?utf-8?B?cXVqU0xtZnhBM0RYdFpkL2lrY0xKTHFRL0VYc1RaS1ordm5JSStCMUVXaUlD?=
 =?utf-8?B?NTVlTTlHd2svSXBqMjdZTnBtNDNkS2ZIaU1ja3B5UFNkdWptak5PeGRnazVm?=
 =?utf-8?B?ekExWlBNRG96M2o4TDVjRlZKRkIwaVpxYjF1L3Jnd3pHMnJxVkswMjZKVXIx?=
 =?utf-8?B?UlNsRnVrSDNOQ2tBK2Y1TlNkdXJaY2dLWjJRRkg0VWNMdmxKUXlSL2NheTVq?=
 =?utf-8?B?WnR6VklyQTBvYllKbG5kOFFycnFYTTgwZlBVcGpXZW8rc2ZDZ0hkaUY2Rkcv?=
 =?utf-8?B?Q0hnYTNoaW1pWEVqR3VmOHc1SlNnRUg4dnRZN0d3N2l1MWs2R2ppU0hrbDQx?=
 =?utf-8?B?a3VKb2d2YURqamRxV1FqNWU4dGI3SWdjZUxUdStBU0hZQVV1VFllWFZHVll6?=
 =?utf-8?B?MlZuVHp4MFBsZkQyUjRJUWNYYWpZNkZ3TmRGeThUL28vRENodXNtUTcxSVZP?=
 =?utf-8?B?QjhkYnhSZDF5YUNYNmJPb2dGRXNiOUFPRW9zN3BtZGFXWFVkNENJYjE5Wkdt?=
 =?utf-8?B?NHczRHcxdzZDektVZjNObEVHTXdjalhHQTNCaklpSEx5WTdiZURJR0RPYUxL?=
 =?utf-8?B?TFJGekVROVRTVG0rTHh4T3FscEQ2VWdoL2ZiZVpCdm0wSytNTTBRaGVrYUJW?=
 =?utf-8?B?SGNEenA0czRycVpRZjJNM1IrNkpsOWVKZkRkVE9XT3d6MU5XYXV3UVlVYjlF?=
 =?utf-8?B?QUZPMVYwNVhKUWRWZDBVTVlsWTVlck9kK2dtRzcxaFZWMDBLRk04QVdMN25v?=
 =?utf-8?B?Ui9iMVE0SEtxY1d4NmVqV0IvdjBTWXNZK1JHN2xUbG1hYm1kMkp4RG5tYjIx?=
 =?utf-8?B?QzI4Qmdob3ZYK2NGVnVCN3BDcWtHcklVZ05TeEpBczBSTTRPZUZwdXdGK01h?=
 =?utf-8?B?VzRyL3YycFFaeDl6dU9hUENBeWlnWms1bW40bUR5VnRmcDZIenVOdDBmR3RV?=
 =?utf-8?B?eEhpWjZUMStHckppWVpYbHRMQzJLZ0FNclFaSzVmYlBSN2ZpZHY0RExQM2VB?=
 =?utf-8?B?V1RQZGlUM3VydHhBZ3dnaEZTMHZJY1VGeFRsNlIvQmJ3SkY0SDRZRFBFOGti?=
 =?utf-8?B?OGdDU0VDdjFHU0NVY1A0b21kcGxEU1BvclpVVldvNUpMMWJtRGs0cElmaUx2?=
 =?utf-8?B?dEtFdm00S2xpaDRDQXozbGpWbTA2UkNUTXkrWDlqMXNzVUxRM0tJenlCMTlL?=
 =?utf-8?B?VWlQYmFsMTFGM1dQMExHTVFGZ1A4MDdTYVVNUWxpeFliVEF4cTI4dFZQUEY0?=
 =?utf-8?B?ek1SN2t2VEYzaDg1Vk45L2xJUzdiMzFrcFZHNmVSMW1wbjRtRTN6a1JXQ2VD?=
 =?utf-8?B?Nnh5ZUFBRmR4VG9BRmtZTDFPUVlDU2x0RlQ2VTBrNDg5dEdlRFJPMXV2ckc5?=
 =?utf-8?B?R0g5azdoVlJIRjJkc3h3SFdOT0hKVUdXc0prQlJ0RHBET2NWTnhjSk5janJT?=
 =?utf-8?B?ejdGY1NlTktnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0QwZjF2S2I3dEswV0ZmUi9adVNUNExKNjIzODFWTjN6WUJpbWVnU3dvNVkv?=
 =?utf-8?B?c0tzbFpYaVZmVGJqa05oVnJvbFVOTXgyMEVCbndoZmJvWTVSWEJFZWFzRmRx?=
 =?utf-8?B?dXV1RzFsa01HMlFZUklhSzUwcWNiWjVxNE9BWTBNWGlNRXFEcUhvSWdTSEJs?=
 =?utf-8?B?dmpvRzY4aElYOGJGcUwxRUZhMmw3Zlg0MVd6ZFM2dFkwdWFjbk9NbFAvb2gw?=
 =?utf-8?B?STRWSXNDemxxVk1RRFdMc2NkTjRVcjZHaUtmUm9SSEFYRnFaazhmd21WTkZK?=
 =?utf-8?B?d0x4Z0hXVG5keS9XZnpIS3loNHMyb0gvRDZMTGpXeTFIc05sdTcyOFdyeFBS?=
 =?utf-8?B?VGIzNHExRU9aZXFnbGtHSnNmN0NzT05RZE5QZGQ2L3hwQ2tVMTREZ1lNVXBo?=
 =?utf-8?B?Y3RpZVFSc29SMWdmR0MrSVVTTEdFcDIrNEhhS3g2VVNTZVpscnRkb0xjdDli?=
 =?utf-8?B?YVBDWUpuYnF6N3FEU1FkL3M4WWtQY21ZY2RSNG9wM1dkU3QwYTR0dEI0NzV5?=
 =?utf-8?B?czZpWTRuOU9KNnoxR042YU0xVkFXdEUyNFhqY1Z5WFE5WnZRSjRpM2NQWVhz?=
 =?utf-8?B?TXBwdVo1Z3RpS2pQOHdzWnk4eXVOUFVoQnVTM25SRmYvbjEwTFRTYkk1NDhR?=
 =?utf-8?B?QTVSZ1lGZjRyVStJSWQrSmIvcE5aeC8wamd3ZEdKTlhvTEhOYngvSDh3aWNl?=
 =?utf-8?B?RmlObUFNRUpvYXk3dzVKTDFHd1IwcWdvZ0o5ZlIvZnN2S3I5aW9KOVYyTzJX?=
 =?utf-8?B?ZHRqT2dHWmVsWHhDNjRITHpwSDFJV2N6aHBjRkRIQW1tWUczcFVnRGlPakZp?=
 =?utf-8?B?eHErRTlVQzBFMXJMZWdXcHBuNGYzbVo4eERkQW51Qkc4ZFFSMHNRaC82UW1k?=
 =?utf-8?B?NDBESmFpSTg3NXdDdytTcEhJbEc2RGFUTXBIQTc0ZHFkcXpVZEpDOXdobk0r?=
 =?utf-8?B?OUlWUlEzbEhwMWFhbm9GTjV1dU9kUGtxdXVtaVI1QllJZEhWUUIrNkJHbkFB?=
 =?utf-8?B?eTVVZkpRS1Z6REs1WDJ1NEh5YkNGMHV4Y3pMYStyTU04ZEFIRmszWmZrbDJo?=
 =?utf-8?B?aTdsUTFqK1BSSFlRdHp1K3VXMjFBVFowZU15YlBSMHh2UFBDajZKNGFVQnpJ?=
 =?utf-8?B?TnRTVFAzak1iL2svRkdqczhsbVNYd1k1c256b3Z1eVNWT2ZMdDBUNS9LWmMr?=
 =?utf-8?B?UlpFODByN0ZPK1kwblhZZm54eGxkUTdiU0tYejM1N0ZCdUxWUG9KMC85OVZ5?=
 =?utf-8?B?ZVlxTGNhdkZHL2h4Zkk1YklPUzdTQ0hsUlBEUngvcFhCNEtVdXpzTFBHWnJm?=
 =?utf-8?B?SEVDMEcvSU5WSGVWWVNMbDh3NFcvN2U2Z2haRUtoSHBVUjJHMHlHTDFxbnhZ?=
 =?utf-8?B?ZVNjOHh6VWM5V2J3Tkp6cHlpU0hGa3lJWktaQkgrNEJ3MXhlanhVWHRscUJ2?=
 =?utf-8?B?Mmhhby9MRkVRMXcvYi9oNCtNUWh6ZW9UR1BrVWExVW51RlNvcEUxaUozQjc2?=
 =?utf-8?B?NU9XRG5Zd1B6MDlVRVM2MEJRSjRxaG1Ya0Raa2wzditJS1M2WHdJUVhrYzRk?=
 =?utf-8?B?eGNvd253aWZqb25hdzBMblVTZmVYL1FpdExaMDRtVmxaSlBKQ0RFMTRNamlN?=
 =?utf-8?B?V2swWklrVXo2SElYd016OGRPOHpMTWVTTGwvWkt5U3dXM1l1UFBPQUtGMGF5?=
 =?utf-8?B?d3dmNkRCRktuMU81aWdyOXNpRlpudW9QejJWc1NndFdOMGFjeUNmTlpWaTJn?=
 =?utf-8?B?ZFdJT0JQbm92YWFrc3FZVXpHTHhnWlFDT3RCZFBhdjR0ak5qZVRlTTZ5TTN2?=
 =?utf-8?B?aDEwcVRQUzc5anprMTJyVHVtNEthdmwyQjVTTmtGZ05wQU41QzBGWGJjREVL?=
 =?utf-8?B?ZTliL0FzUmhhU0VoWUxoNkVJazdIcWdob25oTnJRbHFTUkhFMW16eW80dXlF?=
 =?utf-8?B?MTNDVXhSK05VZHQ2L0Vudm9RRUlrWHFBWVFhbTcxQVJlelZibW5YS1dLeGcz?=
 =?utf-8?B?K3hvbk9oeWoxaXhaUHNkOC9MMkhJY3JoK0F5dFprTlR6aVZHUFZseEJZOUxM?=
 =?utf-8?B?NW1oTisrYmpsUkN3WGRMaVBYc0lrT012Tm9qa0c2dVJjL2w0SE5idlFORkVE?=
 =?utf-8?B?T0ZlczIwWElxeVZKRyt4anpaNW1xL25nSldyZmdscUJ3WkErdUUrZ0h3elMz?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6d81ab-2db5-479f-c102-08de2cd47173
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:13:28.2376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gObCCZoqVJmK6T8EP/CY83hgB4SxucOm2Q7BrHfBBTLpyLVIMD79I6+NBbowpOa9Dkj2NsmZD6bBgStTtGrQVLmTU8hJlAUpt/+u3ljhDRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7626



On 26.11.25 08:59, Jan Beulich wrote:
> On 26.11.2025 00:00, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Introduce separate HVM_SAVE_RESTORE config for HVM save/restore feature,
>> which is enabled by default for HVM and depends on MGMT_HYPERCALLS config.
>>
>> This allows to make MGMT_HYPERCALLS specific changes more granular and, if
>> required, make HVM save/restore optional, selectable feature.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> I'd like to propose this patch as a replacement of Patch 19 [1]
>>
>> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251121105801.1251262-20-Penny.Zheng@amd.com/
>>
>>   xen/arch/x86/cpu/mcheck/vmce.c       | 4 ++--
>>   xen/arch/x86/emul-i8254.c            | 4 +++-
>>   xen/arch/x86/hvm/Kconfig             | 6 ++++++
>>   xen/arch/x86/hvm/Makefile            | 2 +-
>>   xen/arch/x86/hvm/hpet.c              | 3 ++-
>>   xen/arch/x86/hvm/hvm.c               | 4 ++++
>>   xen/arch/x86/hvm/irq.c               | 2 ++
>>   xen/arch/x86/hvm/mtrr.c              | 2 ++
>>   xen/arch/x86/hvm/pmtimer.c           | 2 ++
>>   xen/arch/x86/hvm/rtc.c               | 2 ++
>>   xen/arch/x86/hvm/vioapic.c           | 2 ++
>>   xen/arch/x86/hvm/viridian/viridian.c | 2 ++
>>   xen/arch/x86/hvm/vlapic.c            | 3 ++-
>>   xen/arch/x86/hvm/vpic.c              | 2 ++
>>   xen/arch/x86/include/asm/hvm/save.h  | 5 ++++-
>>   15 files changed, 38 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
>> index 1a7e92506ac8..ba27f6f8bd91 100644
>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>> @@ -349,7 +349,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
>>       return ret;
>>   }
>>   
>> -#if CONFIG_HVM
>> +#if defined(CONFIG_HVM_SAVE_RESTORE)
> 
> #if wasn't really correct to use here; #ifdef was and is wanted.
> 
>>   static int cf_check vmce_save_vcpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
>>   {
>>       struct hvm_vmce_vcpu ctxt = {
>> @@ -380,10 +380,10 @@ static int cf_check vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *
>>   
>>       return err ?: vmce_restore_vcpu(v, &ctxt);
>>   }
>> +#endif /* CONFIG_HVM_SAVE_RESTORE */
>>   
>>   HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
>>                             vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
>> -#endif
> 
> Why would this #endif move? (It gaining a comment is fine of course.)

Huh. Initially I've used __maybe_unused with save/restore callbacks and
HVM_REGISTER_SAVE_RESTORE() defines as NOP.

I'll correct and drop empty HVM_REGISTER_SAVE_RESTORE()

>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -93,4 +93,10 @@ config MEM_SHARING
>>   	depends on INTEL_VMX
>>   	depends on MGMT_HYPERCALLS
>>   
>> +config HVM_SAVE_RESTORE
>> +	depends on MGMT_HYPERCALLS
>> +	def_bool y
>> +	help
>> +	  Enables HVM save/load functionality.
>> +
>>   endif
> 
> This wants to move up some imo; MEM_SHARING is clearing the more niche feature.
> 

Could you clarify preferred place - before which Kconfig option in hvm/Kconfig?


-- 
Best regards,
-grygorii


