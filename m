Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CDEC9ECD2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 12:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176680.1501152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQkeV-0000Rr-4x; Wed, 03 Dec 2025 11:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176680.1501152; Wed, 03 Dec 2025 11:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQkeV-0000Pd-1y; Wed, 03 Dec 2025 11:04:07 +0000
Received: by outflank-mailman (input) for mailman id 1176680;
 Wed, 03 Dec 2025 11:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WC6h=6J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQkeU-0000PX-55
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 11:04:06 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7660fcf-d037-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 12:04:03 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 DB8PR03MB6169.eurprd03.prod.outlook.com (2603:10a6:10:142::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 11:04:01 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 11:03:59 +0000
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
X-Inumbo-ID: c7660fcf-d037-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqlGfjUjz9ZDSz6RWIgrr9tAxX6/Vyak1GtCuV5JVQRDcgmSzmuby+37FVDoGAnx5QaR0097PaRxd6yxZq7aULxbAhXNwIBPljfr+x198Kj2GVZ9OrOI+xn8GHwc/qhvi0hWBUG02L7MNW0bet4rQ1BjB+y5WY/UC3UVgeVv3qcemJxpN0xCwy87obUcWpqRHQiR4F/0VN6T3DhM2AU9DljsElvprc2zDn8V3Ol+QjSqdwITyqKIH4CBoENE7Qy6JGjTI5+VcE+q1KA4cXLdIl1ESwvCfpwqaEKtp0tNW+xfRtNMcFI2LD3wVxHjEzj0qcjN1c8ptk3dMmbW/jnQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1Jw/ELQ5sb17jQ0lDazk6HaRNkoryVDqllHdvMS8dk=;
 b=rNtyeWMsszuWXewLafbTej8dTZM/uSx9AZfQVUhIFxWyPtv7pVWRyfVcaLr1eZaWV6r2Ekxk5PakKTWgNS8wjsuoh9QUKYtH0hTvI0cWWeuVRet+w9m8OFLJ168lKeZIItOkuY9EmqZQqNKLK5G4oKBA9+W7+gIps8EoEXHK/6TmfQf+BC33vDFw9uIBTDX1c/8ekxpRI9rvuajS0slSrOzlWasvIgte+p+HTQbLSHFIZcqnZ6lBDpeaWdEEu0ZgVvUycZd7OvF8p7p+6DzpnciLWVmLzs979NFiSZb4rXNjLUHVj5D4U0L6mzux+1sBxUoEWidzU8fXboS/liF6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Jw/ELQ5sb17jQ0lDazk6HaRNkoryVDqllHdvMS8dk=;
 b=CEzGJRhbV1jGUgiFnBSk7zPbp1NxeQQ0mQwNnmNoJ8R1JWubiQc2R5dNcq4jJ+Kg723aZSz/o4rAGKM6UGEFPDv+xnNgqjgOHIXMGZ3/SuLTRcVNYWiXHzLPb/JistDcF5EDim60zaJSIFU9SJ1bJIZ+cbBqCez2jZTmpv9WmISS/gcFtZOtkcw/2CRnT0QbXWG20vo/x0A/wPpLqOfW02+mKwGP14SIWuwcwnTZ8leITcFkAGFc7W2otdbnml9k6VfBCOs/jOhufNxUYAuerSomK47a4WDSIa1RembXh8lnFeG0IKjY/2k0dE4UvvvBBQFmlVaWIDa+jeaH62XWlg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Topic: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Index: AQHcY8JwgLGK5hUeEUKxVWNaY5XmsLUO3xoAgADiZoA=
Date: Wed, 3 Dec 2025 11:03:59 +0000
Message-ID: <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
 <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
In-Reply-To: <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|DB8PR03MB6169:EE_
x-ms-office365-filtering-correlation-id: 57070236-d332-401b-2165-08de325ba970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWNWRmdMaHRVZGNPdjA0K1M1T1Q3aDlTNHFqVzhqWHB0aFRVUjNzcmJXWEVM?=
 =?utf-8?B?ci9ZUnRoVnZSUnJHWTRLZ25xKy9rcElqU0JsOW1oSy9CeFNaLytCNldtUTc1?=
 =?utf-8?B?c2lvVUdoMmpHVk5mU1FFNTFBNGlPd09oU1FjUHF1WFA0RDlKVkhzSVZyMGgx?=
 =?utf-8?B?WkIrbnRrcm54WlV5TzFvZDB1ZDY0UTBzQ2JIMW9RT3Y3a1lxVGYwM1d5V3Fu?=
 =?utf-8?B?eVV6WVhnU1lBbUFLM0x4UW9XaHAya1V5M29NQmNrYkkrbFZjYUdCSVdScXFH?=
 =?utf-8?B?NXdjOVpzTmwwaWZ4VUkwU1FqNHI1eVFrRWd5UUt5Z0x0a2NUeC9hanN4U2po?=
 =?utf-8?B?V0grUS9sMjNYME9WaWM0dlh4VHVGK0xWQ2pTWEJVMkxGMFo4TXVVWFRlNndk?=
 =?utf-8?B?dm9qSy80cFA2eVV5NmNmQk42QXA4NGVrUHlMeldBWHJIZlhsQzBhSjBlNjd5?=
 =?utf-8?B?SC9pSERHVU5jalIvNktwNElqYVBKNWZGcU1mbWwxV3JVcGZRbklFUzhsQXlW?=
 =?utf-8?B?ZHVRa0hpS1JEV0hwSXdabEtMMmFOeVBqWVZpVzFlTEZiWFFsRkJDNHBpQ1lO?=
 =?utf-8?B?dFNHcC9IWEgzeXo3SWRxTjEzZVhJNmZCMDlWYUNPK0VSczVjVHEzc0VJYmdL?=
 =?utf-8?B?WDlhVnFiUVFMb1pLR1hZRVNGZzFOUDdsSzhzQ2J1WTNaYWZYT0NOdHlkakhW?=
 =?utf-8?B?R0N2T0kxWHc3TllsZDBOMEI1UW5TaDQwNlNTSFhxbWs2TmN5RmlXelc2YUtH?=
 =?utf-8?B?TFFQTUR5YW9RWnpSZHlPT1d4aGhEbzJpVDNLT1hqTTMzK1FrclViVkNoRzAw?=
 =?utf-8?B?ZUc1alh0N0xJc3RFMWJHV2cvWWh2emdDZWUwT01QSnNJYnJoZnlVQWVwTE9W?=
 =?utf-8?B?Mkxtak8yNHM3dS95VTNFS29pcVBmS1BXaW1TelpOMVd4YjhaRVpmOE92QUNV?=
 =?utf-8?B?eWtqK1c1R2hpK2VyMkhwd0xRd0lQT0xTRkpqd2tYWjBQZjVnYnlFeWJiMVpq?=
 =?utf-8?B?TG0zcExJOFlsTmRVZUZ3STNHZmorTGlRQzEvb1dqd3JCSFNURlE2V3JKR0o0?=
 =?utf-8?B?WTNzbWlyQUkrMFpxYW90K09BV0sweVF6cWhOVFdaN2VuOG5pQzRXaFFpdXB0?=
 =?utf-8?B?aTUzM1lRTWdUU1NNZDBDRlBVL1VNMGNyRkVOdkdZWjFpWTFoTU9yUGxpTTdx?=
 =?utf-8?B?SkhFN05NYnYwNmQyTW9YdU5Rc3R1ZGNiN1FSNVFhTkcybkZuSGgwZDYzT2lm?=
 =?utf-8?B?bGFhTllpbThpdnNpb1NhRGhCL0J6VlFPWmFMU0ZTZEpuV2xmUStyUnVXakZE?=
 =?utf-8?B?VDBEU1hpM1d5ODExSVF1QmlOcDR4WDVTdzdZc1BuSEFFN0xjaHR6RUhqekVn?=
 =?utf-8?B?a3l3azBMcHRqOEhjWFkvbWt4cFlaZGFabStYK1paRm5SOTgyRk41WnVzeHRu?=
 =?utf-8?B?eHZjOE41dVI0d05BdldqOXROVm9QdnR1dWJlU1VvNzVFcldjMUw0TklNS3RH?=
 =?utf-8?B?dVVWNTdKVGI0OGtBdTE1YmdCb1NGRFZhZXRYb0QxdHdRY0p4ZGQ0bjVlYm1y?=
 =?utf-8?B?d1Q1b1I0YmFOWHpPSUY3RVI3MzJ1QTdZVFBNSzVFcGFIZ0dOa3ZTeWZ6RHds?=
 =?utf-8?B?NFJJNjY2K3o0MVB2MG5kTnpVdWZMZGphZUpOUkE2Q2xYams1Zk5hUGk5S3RG?=
 =?utf-8?B?Uk81Vk9wTTFod1JrQkpZNzM1dVVVby96bVgwQzNVbHN1UDhkTDdiMndPeFQ3?=
 =?utf-8?B?SGVEQm1RNDYvRWRNL3FwUFdWSFEvVEpEbE4vdExVM0pycWFWbkdYRUVEL044?=
 =?utf-8?B?NWYva01oU045MzVvL0lSTFdnazB0M0xHdUZlSmVKUmJPYSszMjNWZ2hoVDh6?=
 =?utf-8?B?ZHdldUpvYXhaUXpsSGtlSWNrZGtvcHpZbDAvS3VjbVI3NitrNzRKOXNtT2t6?=
 =?utf-8?B?RTJTYUtMWGlMSEdpN2RjT1NFcG1nKzRPcms1NzVRVjRVVEJvUnQwMVFrYStm?=
 =?utf-8?B?aEQ4OEUwVG9haERQV3JvN2s4TFVuTTZScmpxSm1xUE5iUUUxWWdLSXpNMC9i?=
 =?utf-8?Q?T+vMgT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWZuMzU0Z3Qzb2IvMlRsSkRZcENXbS85WEJ3eEtnckNoa1dlSElCQmRSZzRy?=
 =?utf-8?B?VjVzUUZKbTV5OHF3SUltTnRFZUNNbkkvY3llNkZna2YzL0ZlV1B1eG1vWG53?=
 =?utf-8?B?amxzNi9YWUJKb0w3YUMxc2EwamZORldBK0ZkbjNSbGg0OGhPTG1mTUlESWs0?=
 =?utf-8?B?Y0UxZzNDay9aTUg5bkpLVTN2ang4UWdSL09zQzVCNDBnbWo2cGtZOWZUaEk5?=
 =?utf-8?B?NEkrNXZnK3BRQldPejNiL2s3SllFOUF6Yytkb21JVVpkSWdlRVNQWElrRE05?=
 =?utf-8?B?Ny85U1Y4bnVjUUR6SkpwazJFaVZnZ2xJVSt1Ykxxd2Q0UWVLTlI3bWVsbGJO?=
 =?utf-8?B?T1I2Qy9RMWl4L1cySUFJN3crVHVwb1JqcmRMd3I2TmhoWm9IdnVacU02amRu?=
 =?utf-8?B?aFV3OTNVbU5HOTNoTW9vbnJkejVvTGo1NWd5REViUWhBNTFxcS9iSjNlL2h4?=
 =?utf-8?B?b2liT0hXZWUrOFY0Mzl6cmJUS2ZHc3RpSVdvd1BlQm5leE41cU5BdlV6bGNU?=
 =?utf-8?B?bnhzVDZxQmtuWVVId3RZM1BONEZZNHNBNzkvSWZuYUwzeVBRcjlYSndTLzQ5?=
 =?utf-8?B?bU9yeW45YlZQN3BzN3hKNUwrTjdnaWt4T3IvTjVuZ0dpM05GMEw3VGZXSmxF?=
 =?utf-8?B?UVVyK3ZVVmhOSnRONFFWQ1ZoY3hESDcvaG9FcHpNS0dZam4wSWlLV2ZpSGtt?=
 =?utf-8?B?WFBJRW44TmVDU3UwTWl4SUZNYlZzZEM1TXVHbXJvM3loQ1FWYklsVmYremV3?=
 =?utf-8?B?c1I1MzlOVU9SeXJQYU44eG1HNzNTakEzSXpUclRwM250Vm9UbU04S3YycDRh?=
 =?utf-8?B?TFIxVXdLc3lrR2hwanZtN3grb0NVeXh1dkdMcXdRdFppKzRPd3hacUpoOUZj?=
 =?utf-8?B?RjNJMXdwVGxRZlVSa0NKTndpY2FmSnF2ZTBld2pHSkc5bSt5QmpNMnlPQ2Vi?=
 =?utf-8?B?anI5M1FRMUNhZ0oxVmJGRzZqd0VyYW5ldDZrVUthWlFuNGF5QWdYanN4MXdK?=
 =?utf-8?B?K3VGSzkxWWRHNlZMMmJiRnNFS1hhZWhNQlozZWRzc0FLcEx1MmczYUFaU2xF?=
 =?utf-8?B?bW9kb3NtcmR5bzVlMm4vVzR1ZnBxdmhQaG9EZlRTTUJXWnNPc2RCaXJ4WFY1?=
 =?utf-8?B?WmpRd3ErM2JlbVlGZXdjaWJwRm5GWTBzNlpyTFhaa3Vzd2NhbDRtdFc1YWUz?=
 =?utf-8?B?L2VvaDZZSzZndDE4cDNIYmxZYUt1dElMaHhwVWZpU2FVY3VLK2hrdXluS2xy?=
 =?utf-8?B?Y08zMFplV0JLMjF4S21uRUVzR1NlUWhrVFZuSk1RQXFaelFoWUFGMTR0enF2?=
 =?utf-8?B?c28yRzhKR1cra0wxMjlDUnFVUlBZbWdLbTJ0R0g3bEl6eUNEVkxyeGk4VnpL?=
 =?utf-8?B?M0E0b0kwc2hmZjU2Znd6NnhrSFlBbzFENENsUVlsRnpNYlR2RWI1ampiK2Z1?=
 =?utf-8?B?cEs3WnVWUUpJdFJBaHZtN1p3YkpOZENreXE3aXc2anExdFdJQ3ZvUTRPU1NV?=
 =?utf-8?B?eVpEZ1pRRExZalZwZTQ4TTNOSHpnU2VueDdGN215M29PdEk0OGVGUkRUYnAy?=
 =?utf-8?B?NXFVSEV2bnYvWnJYWjlQVi9PZjM3cm0wamhBRVhjL3VROGdzcHdldEJtWnN2?=
 =?utf-8?B?L0dCaGRyL0FUak9iQzVKNzFuUXM0YUd2NzFXUVNIZCthOTB6VXRobU9CY2gz?=
 =?utf-8?B?WStBYy9FdVRvakJicWxGL0Z2aXB2cDVYYnhicFQwM1l6ZW1FSlNtV1hvdmVj?=
 =?utf-8?B?a0pYMkdXK01tbnBmN21SY0NPOFl1MTVvcmlqMzhIdkwwTFhJTkhqTmhGU1NU?=
 =?utf-8?B?YmkyVW0vZzJMWGxmdTR2bndmTlU1NFp4eXZySGZCOFUveG9QbGZSMTd2Nytj?=
 =?utf-8?B?MTd4c3VnS29vT2JXMHp3b2ZESldSUVc5eUtXV1FiSTJDL1JpOFVEdEVoemFq?=
 =?utf-8?B?Q1ZlNWV1U2dwTHovcWozV3ptU0lGeEdYZEtHVGNwLzJ4V1NpakxYS1NIT2gx?=
 =?utf-8?B?Z1BOK1liSHpwci9RYmJvWllUdENWOW9LdWpSY1lWSi96TklHQ1JobUNjNDJI?=
 =?utf-8?B?OHI1R3ZTUm1rWTBBY01IS3BlNDJTbUlIQklzeEFPTk5rQ0RZa2VNekZ4QzlL?=
 =?utf-8?B?aEZWWFJUQkh0MGQwbGFkSnBDa29pZHVielRqT0xmOWN0Z3ZPVDJRUkVkdys1?=
 =?utf-8?Q?pFdUhGcfjoeUVCxZT3eruwM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B7A7E5A66717641AE2337288AF68181@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57070236-d332-401b-2165-08de325ba970
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 11:03:59.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpOEHJXcjOm85e1r8PCMmnPbRONiKSEUIOY/62KJsm+ZCeakIpyCC50EVnRwqKVBtpR3SFATB83sH9TyqFFOIXiQg6XgEAzA8K/NloAc19Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6169

DQoNCk9uIDAyLjEyLjI1IDIzOjMzLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCg0KDQpIZWxs
byBHcnlnb3JpaQ0KDQo+IA0KPiANCj4gT24gMDIuMTIuMjUgMjE6MzIsIE9sZWtzYW5kciBUeXNo
Y2hlbmtvIHdyb3RlOg0KPj4gQ3JlYXRpbmcgYSBndWVzdCB3aXRoIGEgaGlnaCB2Q1BVIGNvdW50
IChlLmcuLCA+MzIpIGZhaWxzIGJlY2F1c2UNCj4+IHRoZSBndWVzdCdzIGRldmljZSB0cmVlIGJ1
ZmZlciAoRE9NVV9EVEJfU0laRSkgb3ZlcmZsb3dzIGR1cmluZyBjcmVhdGlvbi4NCj4+IFRoZSBG
RFQgbm9kZXMgZm9yIGVhY2ggdkNQVSBxdWlja2x5IGV4aGF1c3QgdGhlIDRLaUIgYnVmZmVyLA0K
Pj4gY2F1c2luZyBhIGd1ZXN0IGNyZWF0aW9uIGZhaWx1cmUuDQo+Pg0KPj4gSW5jcmVhc2UgdGhl
IGJ1ZmZlciBzaXplIHRvIDE2S2lCIHRvIHN1cHBvcnQgZ3Vlc3RzIHVwIHRvDQo+PiB0aGUgTUFY
X1ZJUlRfQ1BVUyBsaW1pdCAoMTI4KS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+IE5v
dGljZWQgd2hlbiB0ZXN0aW5nIHRoZSBib3VuZGFyeSBjb25kaXRpb25zIGZvciBkb20wbGVzcyBn
dWVzdA0KPj4gY3JlYXRpb24gb24gQXJtNjQuDQo+Pg0KPj4gRG9tYWluIGNvbmZpZ3VyYXRpb246
DQo+PiBmZHQgbWtub2QgL2Nob3NlbiBkb21VMA0KPj4gZmR0IHNldCAvY2hvc2VuL2RvbVUwIGNv
bXBhdGlibGUgInhlbixkb21haW4iDQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAgXCNhZGRyZXNz
LWNlbGxzIDwweDI+DQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAgXCNzaXplLWNlbGxzIDwweDI+
DQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAgbWVtb3J5IDwweDAgMHgxMDAwMCA+DQo+PiBmZHQg
c2V0IC9jaG9zZW4vZG9tVTAgY3B1cyA8MzM+DQo+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAgdnBs
MDExDQo+PiBmZHQgbWtub2QgL2Nob3Nlbi9kb21VMCBtb2R1bGVANDA0MDAwMDANCj4+IGZkdCBz
ZXQgL2Nob3Nlbi9kb21VMC9tb2R1bGVANDA0MDAwMDAgY29tcGF0aWJsZcKgICJtdWx0aWJvb3Qs
a2VybmVsIiANCj4+ICJtdWx0aWJvb3QsbW9kdWxlIg0KPj4gZmR0IHNldCAvY2hvc2VuL2RvbVUw
L21vZHVsZUA0MDQwMDAwMCByZWcgPDB4MCAweDQwNDAwMDAwIDB4MCAweDE2MDAwID4NCj4+IGZk
dCBzZXQgL2Nob3Nlbi9kb21VMC9tb2R1bGVANDA0MDAwMDAgYm9vdGFyZ3MgImNvbnNvbGU9dHR5
QU1BMCINCj4+DQo+PiBGYWlsdXJlIGxvZzoNCj4+IChYRU4pIFhlbiBkb20wbGVzcyBtb2RlIGRl
dGVjdGVkDQo+PiAoWEVOKSAqKiogTE9BRElORyBET01VIGNwdXM9MzMgbWVtb3J5PTB4MTAwMDBL
QiAqKioNCj4+IChYRU4pIExvYWRpbmcgZDEga2VybmVsIGZyb20gYm9vdCBtb2R1bGUgQCAwMDAw
MDAwMDQwNDAwMDAwDQo+PiAoWEVOKSBBbGxvY2F0aW5nIG1hcHBpbmdzIHRvdGFsbGluZyA2NE1C
IGZvciBkMToNCj4+IChYRU4pIGQxIEJBTktbMF0gMHgwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDQ0
MDAwMDAwICg2NE1CKQ0KPj4gKFhFTikgRGV2aWNlIHRyZWUgZ2VuZXJhdGlvbiBmYWlsZWQgKC0y
MikuDQo+PiAoWEVOKQ0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KPj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+PiAoWEVOKSBDb3VsZCBub3Qgc2V0
IHVwIGRvbWFpbiBkb21VMCAocmMgPSAtMjIpDQo+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqDQo+PiAtLS0NCj4+IC0tLQ0KPj4gwqAgeGVuL2NvbW1vbi9k
ZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIHwgOCArKysrKy0tLQ0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi8g
DQo+PiBkZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+PiBpbmRleCAzZjViOTg3ZWQ4Li5k
N2QwYTQ3Yjk3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVz
cy1idWlsZC5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxk
LmMNCj4+IEBAIC00NjEsMTAgKzQ2MSwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCANCj4+IGRvbWFp
bl9oYW5kbGVfZHRiX2Jvb3RfbW9kdWxlKHN0cnVjdCBkb21haW4gKmQsDQo+PiDCoCAvKg0KPj4g
wqDCoCAqIFRoZSBtYXggc2l6ZSBmb3IgRFQgaXMgMk1CLiBIb3dldmVyLCB0aGUgZ2VuZXJhdGVk
IERUIGlzIHNtYWxsIA0KPj4gKG5vdCBpbmNsdWRpbmcNCj4+IC0gKiBkb21VIHBhc3N0aHJvdWdo
IERUIG5vZGVzIHdob3NlIHNpemUgd2UgYWNjb3VudCBzZXBhcmF0ZWx5KSwgNEtCIA0KPj4gYXJl
IGVub3VnaA0KPj4gLSAqIGZvciBub3csIGJ1dCB3ZSBtaWdodCBoYXZlIHRvIGluY3JlYXNlIGl0
IGluIHRoZSBmdXR1cmUuDQo+PiArICogZG9tVSBwYXNzdGhyb3VnaCBEVCBub2RlcyB3aG9zZSBz
aXplIHdlIGFjY291bnQgc2VwYXJhdGVseSkuIFRoZSANCj4+IHNpemUgaXMNCj4+ICsgKiBwcmlt
YXJpbHkgZHJpdmVuIGJ5IHRoZSBudW1iZXIgb2YgdkNQVSBub2Rlcy4gVGhlIHByZXZpb3VzIDRL
aUIgDQo+PiBidWZmZXIgd2FzDQo+PiArICogaW5zdWZmaWNpZW50IGZvciBndWVzdHMgd2l0aCBo
aWdoIHZDUFUgY291bnRzLCBzbyBpdCBoYXMgYmVlbiANCj4+IGluY3JlYXNlZA0KPj4gKyAqIHRv
IHN1cHBvcnQgdXAgdG8gdGhlIE1BWF9WSVJUX0NQVVMgbGltaXQgKDEyOCkuDQo+PiDCoMKgICov
DQo+PiAtI2RlZmluZSBET01VX0RUQl9TSVpFIDQwOTYNCj4+ICsjZGVmaW5lIERPTVVfRFRCX1NJ
WkUgKDQwOTYgKiA0KQ0KPiANCj4gTWF5IGJlIEl0IHdhbnRzIEtjb25maWc/DQo+IE9yIHNvbWUg
Zm9ybXVsYSB3aGljaCBhY2NvdW50cyBNQVhfVklSVF9DUFVTPw0KDQoNCkkgYWdyZWUgdGhhdCB1
c2luZyBhIGZvcm11bGEgdGhhdCBhY2NvdW50cyBmb3IgTUFYX1ZJUlRfQ1BVUyBpcyB0aGUgbW9z
dCANCnJvYnVzdCBhcHByb2FjaC4NCg0KSGVyZSBpcyB0aGUgZW1waXJpY2FsIGRhdGEgKGJ5IHRl
c3Rpbmcgd2l0aCB0aGUgbWF4aW11bSBudW1iZXIgb2YgZGV2aWNlIA0KdHJlZSBub2RlcyAoZS5n
LiwgaHlwZXJ2aXNvciBhbmQgcmVzZXJ2ZWQtbWVtb3J5IG5vZGVzKSBhbmQgZW5hYmxpbmcgYWxs
IA0Kb3B0aW9uYWwgQ1BVIHByb3BlcnRpZXMgKGUuZy4sIGNsb2NrLWZyZXF1ZW5jeSkpOg0KDQpj
cHVzPTENCihYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogMTU4NiBieXRlcw0KDQpj
cHVzPTINCihYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogMTY5OCBieXRlcw0KDQpj
cHVzPTMyDQooWEVOKSBGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6IDUwNTggYnl0ZXMNCg0K
Y3B1cz0xMjgNCihYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogMTU4MTAgYnl0ZXMN
Cg0KDQpzdGF0aWMgaW50IF9faW5pdCBwcmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBrZXJuZWxfaW5mbyANCipraW5mbykNCiAgew0KICAgICAgaW50IGFkZHJjZWxscywg
c2l6ZWNlbGxzOw0KQEAgLTU2OSw2ICs1NjksOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwcmVwYXJl
X2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQsIA0Kc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykN
CiAgICAgIGlmICggcmV0IDwgMCApDQogICAgICAgICAgZ290byBlcnI7DQoNCisgICAgcHJpbnRr
KCJGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6ICVkIGJ5dGVzXG4iLCANCmZkdF90b3RhbHNp
emUoa2luZm8tPmZkdCkpOw0KKw0KICAgICAgcmV0dXJuIDA7DQoNCiAgICBlcnI6DQoNClRoaXMg
ZGF0YSBzaG93cyAoYXNzdW1pbmcgbXkgdGVzdGluZy9jYWxjdWxhdGlvbnMgYXJlIGNvcnJlY3Qp
Og0KDQotIEEgbWFyZ2luYWwgY29zdCBvZiAxMTIgYnl0ZXMgcGVyIHZDUFUgaW4gdGhlIGZpbmFs
LCBjb21wYWN0ZWQgZGV2aWNlIHRyZWUuDQotIEEgZml4ZWQgYmFzZSBzaXplIG9mIDE0NzQgYnl0
ZXMgZm9yIGFsbCBub24tdkNQVSBjb250ZW50Lg0KDQpCYXNlZCBvbiB0aGF0IEkgd291bGQgcHJv
cG9zZSB0aGUgZm9sbG93aW5nIGZvcm11bGEgd2l0aCB0aGUganVzdGlmaWNhdGlvbjoNCg0KLyoN
CiAgKiBUaGUgc2l6ZSBpcyBjYWxjdWxhdGVkIGZyb20gYSBmaXhlZCBiYXNlbGluZSBwbHVzIGEg
c2NhbGFibGUNCiAgKiBwb3J0aW9uIGZvciBlYWNoIHBvdGVudGlhbCB2Q1BVIG5vZGUgdXAgdG8g
dGhlIHN5c3RlbSBsaW1pdA0KICAqIChNQVhfVklSVF9DUFVTKSwgYXMgdGhlIHZDUFUgbm9kZXMg
YXJlIHRoZSBwcmltYXJ5IGNvbnN1bWVyDQogICogb2Ygc3BhY2UuDQogICoNCiAgKiBUaGUgYmFz
ZWxpbmUgb2YgMktpQiBpcyBhIHNhZmUgYnVmZmVyIGZvciBhbGwgbm9uLXZDUFUgRkRUDQogICog
Y29udGVudC4gVGhlIDEyOCBieXRlcyBwZXIgdkNQVSBpcyBkZXJpdmVkIGZyb20gYSB3b3JzdC1j
YXNlDQogICogYW5hbHlzaXMgb2YgdGhlIEZEVCBjb25zdHJ1Y3Rpb24tdGltZSBzaXplIGZvciBh
IHNpbmdsZQ0KICAqIHZDUFUgbm9kZS4NCiAgKi8NCiNkZWZpbmUgRE9NVV9EVEJfU0laRSAoMjA0
OCArIChNQVhfVklSVF9DUFVTICogMTI4KSkNCg0KKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KDQpQbGVhc2UgdGVsbCBtZSB3b3VsZCB5b3UgYmUgaGFwcHkg
d2l0aCB0aGF0Pw0KDQoNCj4gDQo+PiDCoCBzdGF0aWMgaW50IF9faW5pdCBwcmVwYXJlX2R0Yl9k
b21VKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCANCj4+IGtlcm5lbF9pbmZvICpraW5mbykNCj4+
IMKgIHsNCj4+IMKgwqDCoMKgwqAgaW50IGFkZHJjZWxscywgc2l6ZWNlbGxzOw0KPiANCg==

