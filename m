Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5CCB0F90
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 20:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182164.1505087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3my-00064J-Q7; Tue, 09 Dec 2025 19:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182164.1505087; Tue, 09 Dec 2025 19:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3my-00061o-MZ; Tue, 09 Dec 2025 19:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1182164;
 Tue, 09 Dec 2025 19:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vT3mx-00061i-8N
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 19:54:23 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9b47ea4-d538-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 20:54:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB4967.namprd03.prod.outlook.com (2603:10b6:a03:1e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 19:54:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 19:54:15 +0000
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
X-Inumbo-ID: d9b47ea4-d538-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueQJiMvTGZ4Z/K/9HYzFDt9sIxjO9ytRa01Ckoa6vcH8yuUY6sZH4CI3hHuv7f4VbQ85haVK6lHCBOFQvAwJTFYU5upIe1z3CiwF8pkddjzNo341Yc0vxRvHm8rBDKsm8oSR3P9W228vEhXCdPpolU7YwioNE+qaOydeN+bFxh7jwj2Zu7RO+kP5wlyCWUGpChTP0z+gn/tS0a6ogykc7zKESkJT+l1smr1sDvOusk+59Hy4TKHhcCWNUUXZ4f5mtOBQI+jWC9REfa/k6jmiOC0C8+n/CZa6puUMgxYb+W8JUDyEHDRzpcV6ZeGcWYTRQC6JjqIFpEd2JlAC2uOhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPJDc6Eb3kzVdDowzLmpwXresW43dsdKD8iMDM9CUmo=;
 b=m1d3iilmj2l63pjOdDbSHaKR7cT/YCMguwFKdIGaLogFNg2mbnO6AfQWt8sqZKjU4VvAM9HkAZk05FH9QVkUiPyQmebS3O0fqiRf/oBpz5hry/TcCw6bIl4ENhWwaL+efA08kRsDqex86eqlrPOQscaa9DtxL8x8u40K3zfW5Cc9b2i6UJWqqaKeqUenZBmMtY9E6OdltZsAgNUMP42KnChrg5WJsL9I3QBpH91pmUrDXqDsj5j/hfu++NAcwes56IwSOD1EI4nZjJjRqSRiG4JUjDtmlEe9khLDi5CJd001Cd004UUNOwVNkKDggZHvuWjaVNM/DsUH6ihoLCdteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPJDc6Eb3kzVdDowzLmpwXresW43dsdKD8iMDM9CUmo=;
 b=erbrraKJsSXFEsc4uKhiLDtkSl4w1/2+IdTaFez261vca5JoAQjRUAVIZ/KS4xHgmiQL2Ujz1u1D0hAXlW/0szAZwXZqx0AvLfMah23tYOJW7gzQIyZ/8Xu39Z2OXQvT2e5EHawnn4HatTgh9YqdrG2iHjt/WDXQsIEOsBLPJjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/mixed; boundary="------------ekj7blkzKlXEAVmyXxnFbw53"
Message-ID: <48f94309-53ad-4bc3-b06d-8c7bd4294481@citrix.com>
Date: Tue, 9 Dec 2025 19:54:12 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/pv: Inline domain_set_alloc_bitsize() into it's
 single caller
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
 <83c524ed-dec0-4792-9129-0bfc7498ac97@epam.com>
 <d8a37c7e-106f-4bb3-a4fb-3ad082cda7fa@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d8a37c7e-106f-4bb3-a4fb-3ad082cda7fa@citrix.com>
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f1cd88-127c-45da-bbbf-08de375cbb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0szTVNOMnNoWXFCQXBOYWlFYk8wclRSNDhNampsYXUwV1FENHB1K1ZmYVE2?=
 =?utf-8?B?S0p2ZDBPVUJ1bW5tNnZ6czlMa1J5QldkU20wa1RWMDFpWlVmQUV4YUR5Sll0?=
 =?utf-8?B?YXpYcjFQalFIMXVSbXg0WDgrRVpndmk1dml3Z0k2SFh6S0F2eUxGeEVYOHVQ?=
 =?utf-8?B?SUp3bUUwUS9DdjVobzRoRHNmMzBSVDl1cHkvUFdsV21LWno3ZkF2ZlcyRFVk?=
 =?utf-8?B?bTVhVnVId2RZY2pKdFdoTGgwOCs1SWQydzY3RWpQSE5vL25SMUptajZTdldU?=
 =?utf-8?B?SmdDZTdzckg3Mm1jempTSjBBWW5Wc3M2VUdpZytPd1JON2U3dlpqY3pFYnNy?=
 =?utf-8?B?SloySW9ReWxrOHI4VlVHZ0hGU0lZQ0puNkNPWDIwQ002MzZ1STNVSk9IOW9F?=
 =?utf-8?B?ZWI3SUw1OFhWZXBZYk43cTlocTRUeERwU3ZIZFY1dkFtc0czQldxbDlreTE4?=
 =?utf-8?B?eWQ3NXZhckZlQVRmZmdEYS9kbTdaTXFvaENIb3pVb3pUOHByY1FxQkg0c28w?=
 =?utf-8?B?Ymsxd0xndEZzN1dhWjhwUGZOUW1YakYyT2JEaUdJK1dFUSt3WUEyU1JqbUt5?=
 =?utf-8?B?dmp2TFVnS1hlemp1dXZBUXoreDRRNDVqSmF2YWhPc2trQ1g3VUp4T2dzQWRW?=
 =?utf-8?B?NnB5ZTJQZEJ6NE1pS25QUE8veHA5VWNUamJmNVkyMjAwcDJJRjAyRGh3U254?=
 =?utf-8?B?c2JxMENtdk1IdFlaQTlLemJ3dkQyU0JNbFV0MDREZWRhNFF0d29DWWtPaDFl?=
 =?utf-8?B?aDIyeXpTVzdHRHZtMUVVOHhtdzZ1cW9JWElBYWQ2S2FVR1VDS1NzMCtIMHZ2?=
 =?utf-8?B?bTdJcm52MzhPT2pYdGdPVnFIS3lmcVo1ZUhHQ2g0NHlJOGtudmx1VTlkUTQ3?=
 =?utf-8?B?aVdlaURVVWlpeno2OHorMTA1RzZFUytCUTRZQjc5bUg3QWpEdFI3WTZzMU1s?=
 =?utf-8?B?MGNVK0JyaXVVN3EzUGdaNGMzcWNLOHNKOU43aUJUT2JENGhNTUlkaXVFeDB5?=
 =?utf-8?B?V2t3SnVSS0pvZU9oVlZoVmhVM1B0bGRoN01yUVhSbnZDM2N5Ny9ZWXRZYjlP?=
 =?utf-8?B?VTUwbytKVmVUbWgvY1pCeWdTQVJRUGYrTEUzbFVDcGdHQi9tZC90N0dHcHJj?=
 =?utf-8?B?ZzVjOHhpbEVsekRaMUpYZmxmci9BL0lxb2NpTWVFRTVUSzlSTVVDK3ZDZmpa?=
 =?utf-8?B?TU1Tb0Z2Uk1OQ0swVkFTU0hkaUwvbTVQWExQT1R3L2FWSGUwcy8wZmhXRFkz?=
 =?utf-8?B?NFVZY0RpQitIaUhnS0RiRWhxajk3UTlaSXUxNHFRdDl3OFVNdzUzb2NRN3kx?=
 =?utf-8?B?YU9nNitFSExUQndIT2tnU1lrUDZOKzBUNHE1OVJ5c3ByLzVqN1ZiZit0M1J1?=
 =?utf-8?B?bVl1TXJDY0JVbmhUU2dvZ0JvK3hwQ3VCRkt0bytMMUNoQ3doVEhhcGtJSkJl?=
 =?utf-8?B?bGx2UVVJbE9mMk1OSUlxUjFiWi9YYS9tYzFqSGNHWEJoYXBiRDQxUCtNa1M5?=
 =?utf-8?B?bHRuaW1iN3pnaC9BNEtjYnNKQUdOQmQzenp2UkNJMCtINWNQSlI5Tjg0dEZO?=
 =?utf-8?B?RlNUeDloWWNENHkxUmZqVjNOMzQvNERtM1hwUER3Y1AzNTNydlhuVmpaWitN?=
 =?utf-8?B?bnd2NlpQR0FTWmY1blRjRC85QWtwcmdzaXdtdFo1cWIrOVV6YXkvT3J3ekpt?=
 =?utf-8?B?NnpTQ3JhQmNtcDlPQTUwQjVCVGQyNStXYWNvcHptcGVoRllldEV6NlBId3N5?=
 =?utf-8?B?THlrL25YSmk0TXFrWE9pWEw3SGV0K0xpcys0RWVxZUxUM1YrOHdLN0pSbFNE?=
 =?utf-8?B?eWNxTHlUMm5odXN1QWRkNm9DbzFvbW1WL3l0eS8rSEh2VFBsNEl6b1MrMVlT?=
 =?utf-8?B?ZHFzOCt3Y3plZHpZYnNFTFllanowekF0dnpHL1NqQm1GMXRQd3JaM2NPY0tK?=
 =?utf-8?Q?YPv1hx1n8278XJgvm1Fua3J0ErC97ndr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzRDbkpOVlB3azltcWQ3dmVHZCtxWnJFSHl2T1dYTTk5SWpIS2JiQlZmWi9h?=
 =?utf-8?B?SG1vV3VndUo4TWh1VC95SGlwSU9QdDB5NVdESmxTME1kOHQ2T20xTnptRUxs?=
 =?utf-8?B?ZEZLVkRWbCtoOXRkK01SdWs0alZUeU8rZUp6MVhtaWU1dDBIelNTdWN2Ky94?=
 =?utf-8?B?V1BFNStzeXZZb3pDM1czcTk3d2VsZlhHSXFHWmtiMmhRWFBRZlUwcW1WMng2?=
 =?utf-8?B?a0xtVHBCekFBWlFQakZtZU56SDZHbEdieExmZU1Hc2NkbGVua1Jrb2dhTytj?=
 =?utf-8?B?clBJaW1JbkRpSWtHbC9haG8zL0QvMEVrOENyZ29wQ3pHaDRMWjA4YjJ5L2dv?=
 =?utf-8?B?cTBiZFlvMEYrMEpCaE81MG9XV1daQ2JhbTJUcThya3lJb1lYRkl1MTVSQXpE?=
 =?utf-8?B?b2NXL2t6ci9rZWs2UWdYVXRJSDU1djlKd0NlZTdRS3p5eHhjTFJMWWw5bEZj?=
 =?utf-8?B?S2pUOTNCKzhHekhxM2U5dUFmQ2JCNmNRQmVEOVBBaW1VYm1FM2RuWUNJWnY0?=
 =?utf-8?B?cHZTZ3ZPeVpGZ1JseG5ZVDhRRURqWjB2dXhqVW45TUtCM0RCYm9pWm93d0I4?=
 =?utf-8?B?eHNCTDc2djh2S2FUNjd6YlJNTDNQUERhUmwzRDJPS214aE55N1Q4TWkzQlcy?=
 =?utf-8?B?d2kwWTUzYjZxekd6Z3lTSWVucjk0ZVdRTnZTZkd5SVNFNnRybHQ2cklrc01j?=
 =?utf-8?B?RkYvWWlCMlI5KzdnVHp1cmZEUTlEYVQ2YUhGVlV5ZWI5a3ptazYrTThDOGdw?=
 =?utf-8?B?clcwL3JkT010SSs1cnJWMFcvQnRtNll1eXVPbi8yK0FmM0NJT29ZdzhPcWZs?=
 =?utf-8?B?Z1lPZXNwemYvY3lCbEY0eTBsNHN5eTlZZ3g5Nm5DZzFFc0JyYkdUZzc0WXhC?=
 =?utf-8?B?VTBSMzd2L0VXU3RVZFJtaDVzbk4ycWVtWjlEM3EvZktGdzdLUXZQR0pNV0ds?=
 =?utf-8?B?Sld0dk1uN2xhdWFCeE1IU0ZscnE2UVMyNmJZTnNNVUkySEw5ejJBa0llT2tY?=
 =?utf-8?B?aEloMnN0SWF3blFXZFBPZDlYbGdIcWM0MUJieW5GMkFFOW1rUTdQaE5TS0NG?=
 =?utf-8?B?cWtPM0ZwYlVQRzZLd2QrdmUvTE1OY0NlK1V3QmpJZzhwaVhwamtoL013T3gx?=
 =?utf-8?B?b1QrZDNKTS9jNVEwVEhFQVpXTUFCQ1JDUG1BTUovWXdCZyt0MUxVeDROUnM5?=
 =?utf-8?B?RXE5UE1zb3NUeTg1bGhFYy9RSUhXRHFMYXp4YWFvVDl2cExPYnJuN1k5OEZB?=
 =?utf-8?B?VlpXUnRvK2hOTVVKRDNGdDZDQ0JURWtHcjd6TnFqWmlJcDBDZFpWZnBRZmdt?=
 =?utf-8?B?dGZ5emVvL3dlWm9uTER2V0JDM3oxeXZ6ZHRoZmRtQ2lxenUxUE9qQ1MwWjJ5?=
 =?utf-8?B?Ym9LS1RkM1ZnQTJjeGo0cElrUjlpS3JoazhKOGprYTlVbFlWL2ZSTjcvcTBX?=
 =?utf-8?B?OVg5SFY5UHBiMjk4Tzdia0tyNXpON0VqK0U2THl3K0daaVV1azRXNU1TbDdj?=
 =?utf-8?B?THFzWGg1V2FMV1F3Nm5zUnBtMVl1WW40b0JnUlVZeU5sV0FtWkVsTUZUZEJy?=
 =?utf-8?B?N1lUUGphQy9ubXBUZFFncVp3QzNPWEdSTjhXWFBWMWhqcFRJSGpkcWlCN1ll?=
 =?utf-8?B?dmI3VWExSmlGWWFKaWtWUHAvbWl2allLZ1Bhc04rQjJpQnAzbFJPU3pnb0tO?=
 =?utf-8?B?aVB4ekNTd2dPcENPYTZEeWNSRjFJT0RZaCtRalMvbzMzem9WbXpUOEZ2WFFE?=
 =?utf-8?B?VjVoVGQ5Ty8reG5rcnVVVCtCbEVNc0JvYkRmM3hDZnA3bnNFRi94T0JQWXZE?=
 =?utf-8?B?QUdURnNTWnpTNmdMbDUxbGF6QjB1Sy8zNzJCYkQ2M2p5RHE5VUZPdmxMV2Qw?=
 =?utf-8?B?NUZmY2xlU3h6cnZJT2NlVXo1aDI4NUhEaE9iZkFqNzNtVnZzVXBXdnQ2bVF2?=
 =?utf-8?B?aW02cEh4TjR6SmhOYWxJQXJUUytCWHVXUEp6UTAvOGE5VStqeG9PaDA1b05z?=
 =?utf-8?B?ajNIRDkrVnQvTXFhWWVFNWswVS9PWWExOEhnemNtVXVMOWdzWjBEaGhlQ2s3?=
 =?utf-8?B?MXpyeElhbUV6MHY3bEZKVG5Xbkx1NEpkRUV3Y0M2SVFzUEFuSGkrNHhodUFG?=
 =?utf-8?B?bDZEVTVGNE9oNVJMd2VVTTBDZ1V5cjlCcW5nWG5LeG5CRGhNeGRwT3Z4anhV?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f1cd88-127c-45da-bbbf-08de375cbb88
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:54:15.6720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wc090xY2/MvVDSeyjc7i4zt+jIXCpJnH+7ik5MleMv+adfZbtEUB035HlS70ovTSzyFQjplpttXSfyqRWru3pWtz/KulYw3eeuM7N0nKfog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967

--------------ekj7blkzKlXEAVmyXxnFbw53
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/12/2025 7:29 pm, Andrew Cooper wrote:
> On 09/12/2025 7:21 pm, Grygorii Strashko wrote:
>> Hi Andrew,
>>
>> On 09.12.25 20:07, Andrew Cooper wrote:
>>> Prior to commit 02e78311cdc6 ("x86/domctl: Make
>>> XEN_DOMCTL_set_address_size
>>> singleshot") (Xen 4.9, 2016), it was possible for domains to switch
>>> to being
>>> compat, and back again.  Since then however, becoming compat is a
>>> singleton
>>> action that can't be undone.
>>>
>>>  From the context it's clear to see the is_pv_32bit_domain() check is
>>> redundant, and from the singleton nature being the only place setting
>>> physaddr_bitsize, there's no need to check it for being 0.
>>>
>>> No functional change.
>>>
>>> Co-developed-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Split out of series to simplify things.
>>>
>>> bloat-o-meter reports:
>>>
>>>    add/remove: 0/1 grow/shrink: 1/0 up/down: 25/-96 (-71)
>>>    Function                                     old     new   delta
>>>    switch_compat                                447     472     +25
>>>    domain_set_alloc_bitsize                      96       -     -96
>>>
>>> which will mostly be the LFENCEs embedded in is_pv_32bit_domain().
>> Thank you for doing this.
>> Not sure if it's needed, any way.
>> Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>
> It does help.  Technically it lets me commit the patch right now, but
> I'll leave it until at least tomorrow in case anyone else has comments.
>
> ~Andrew
>

FYI, here is the remainder of your patch rebased over this one.

I recommend splitting it into two, one sorting out
domain_clamp_alloc_bitsize() (however that will end up looking), and one
moving physaddr_bitsize into pv_domain.

It's almost always better to separate code movement from logical changes.

~Andrew

--------------ekj7blkzKlXEAVmyXxnFbw53
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-x86-move-d-arch.physaddr_bitsize-field-handling-.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-x86-move-d-arch.physaddr_bitsize-field-handling-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2NjM5ZmQ5ZTc1Y2I1YzNhMDM1MTIwNWI5ZDg5ZWUxMmNhMGI1Y2MxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHcnlnb3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNoa29A
ZXBhbS5jb20+CkRhdGU6IEZyaSwgMjggTm92IDIwMjUgMTU6MjI6MjEgKzAwMDAKU3ViamVjdDog
eGVuL3g4NjogbW92ZSBkLT5hcmNoLnBoeXNhZGRyX2JpdHNpemUgZmllbGQgaGFuZGxpbmcgdG8g
cHYzMgoKVGhlIGQtPmFyY2gucGh5c2FkZHJfYml0c2l6ZSBmaWVsZCBpcyB1c2VkIG9ubHkgYnkg
UFYzMiBjb2RlLCBzbzoKCi0gbW92ZSBkb21haW5fc2V0X2FsbG9jX2JpdHNpemUoKSBmdW5jdGlv
biBpbnRvIFBWMzIgY29kZSBhbmQKICBpbmxpbmUgaXQgaW50byBzd2l0Y2hfY29tcGF0KCkKLSBt
b3ZlIGRvbWFpbl9jbGFtcF9hbGxvY19iaXRzaXplKCkgZnVuY3Rpb24gaW50byBQVjMyIGNvZGUK
ICBhbmQgY29udmVydCB0byBtYWNybwotIG1vdmUgZC0+YXJjaC5waHlzYWRkcl9iaXRzaXplIGZp
ZWxkIHVuZGVyIFBWMzIgaWZkZWYgaW50bwogIHN0cnVjdCBwdl9kb21haW4KClNpZ25lZC1vZmYt
Ynk6IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4KCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZG9tYWluLmggYi94ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vZG9tYWluLmgKaW5kZXggMzg2ZWM2MTc0NTg5Li4zZjJkNTVjMmI5Y2YgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kb21haW4uaAorKysgYi94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vZG9tYWluLmgKQEAgLTI3OSw2ICsyNzksMTEgQEAgc3RydWN0IHB2
X2RvbWFpbgogCiAgICAgYXRvbWljX3QgbnJfbDRfcGFnZXM7CiAKKyNpZmRlZiBDT05GSUdfUFYz
MgorICAgIC8qIE1heGltdW0gcGh5c2ljYWwtYWRkcmVzcyBiaXR3aWR0aCBzdXBwb3J0ZWQgYnkg
dGhpcyBndWVzdC4gKi8KKyAgICB1bnNpZ25lZCBpbnQgcGh5c2FkZHJfYml0c2l6ZTsKKyNlbmRp
ZgorCiAgICAgLyogSXMgYSAzMi1iaXQgUFYgZ3Vlc3Q/ICovCiAgICAgYm9vbCBpc18zMmJpdDsK
ICAgICAvKiBYUFRJIGFjdGl2ZT8gKi8KQEAgLTMxOSw5ICszMjQsNiBAQCBzdHJ1Y3QgYXJjaF9k
b21haW4KICAgICB1bnNpZ25lZCBpbnQgaHZfY29tcGF0X3ZzdGFydDsKICNlbmRpZgogCi0gICAg
LyogTWF4aW11bSBwaHlzaWNhbC1hZGRyZXNzIGJpdHdpZHRoIHN1cHBvcnRlZCBieSB0aGlzIGd1
ZXN0LiAqLwotICAgIHVuc2lnbmVkIGludCBwaHlzYWRkcl9iaXRzaXplOwotCiAgICAgLyogSS9P
LXBvcnQgYWRtaW4tc3BlY2lmaWVkIGFjY2VzcyBjYXBhYmlsaXRpZXMuICovCiAgICAgc3RydWN0
IHJhbmdlc2V0ICppb3BvcnRfY2FwczsKICAgICB1aW50MzJfdCBwY2lfY2Y4OwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21tLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9h
c20vbW0uaAppbmRleCA5NDM4ZjVlYTAxMTkuLmEzMDhhOThkZjJhNCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL21tLmgKKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNt
L21tLmgKQEAgLTYxOSw4ICs2MTksMTIgQEAgdm9pZCBfX2lvbWVtICppb3JlbWFwX3djKHBhZGRy
X3QgcGEsIHNpemVfdCBsZW4pOwogCiBleHRlcm4gaW50IG1lbW9yeV9hZGQodW5zaWduZWQgbG9u
ZyBzcGZuLCB1bnNpZ25lZCBsb25nIGVwZm4sIHVuc2lnbmVkIGludCBweG0pOwogCi11bnNpZ25l
ZCBpbnQgZG9tYWluX2NsYW1wX2FsbG9jX2JpdHNpemUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGJpdHMpOwotI2RlZmluZSBkb21haW5fY2xhbXBfYWxsb2NfYml0c2l6ZShkLCBiaXRz
KSBkb21haW5fY2xhbXBfYWxsb2NfYml0c2l6ZShkLCBiaXRzKQorI2lmZGVmIENPTkZJR19QVjMy
CisjZGVmaW5lIGRvbWFpbl9jbGFtcF9hbGxvY19iaXRzaXplKGQsIGJpdHMpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICgoKGQpICYmIChkKS0+YXJjaC5wdi5waHlz
YWRkcl9iaXRzaXplKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAg
ICAgID8gbWluX3QodWludDMyX3QsIChkKS0+YXJjaC5wdi5waHlzYWRkcl9iaXRzaXplLCAoYml0
cykpICAgICAgICAgICAgICBcCisgICAgICAgICA6IChiaXRzKSkKKyNlbmRpZgogCiB1bnNpZ25l
ZCBsb25nIGRvbWFpbl9nZXRfbWF4aW11bV9ncGZuKHN0cnVjdCBkb21haW4gKmQpOwogCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2Rv
bTBfYnVpbGQuYwppbmRleCAyMTE1OGNlMTgxMmUuLjk0Zjc5NzZlODE5ZiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9i
dWlsZC5jCkBAIC02MjYsOCArNjI2LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGRvbTBfY29uc3Ry
dWN0KGNvbnN0IHN0cnVjdCBib290X2RvbWFpbiAqYmQpCiAgICAgICAgIGluaXRyZF9tZm4gPSBw
YWRkcl90b19wZm4oaW5pdHJkLT5zdGFydCk7CiAgICAgICAgIG1mbiA9IGluaXRyZF9tZm47CiAg
ICAgICAgIGNvdW50ID0gUEZOX1VQKGluaXRyZF9sZW4pOwotICAgICAgICBpZiAoIGQtPmFyY2gu
cGh5c2FkZHJfYml0c2l6ZSAmJgotICAgICAgICAgICAgICgobWZuICsgY291bnQgLSAxKSA+PiAo
ZC0+YXJjaC5waHlzYWRkcl9iaXRzaXplIC0gUEFHRV9TSElGVCkpICkKKworI2lmZGVmIENPTkZJ
R19QVjMyCisgICAgICAgIGlmICggZC0+YXJjaC5wdi5waHlzYWRkcl9iaXRzaXplICYmCisgICAg
ICAgICAgICAgKChtZm4gKyBjb3VudCAtIDEpID4+IChkLT5hcmNoLnB2LnBoeXNhZGRyX2JpdHNp
emUgLSBQQUdFX1NISUZUKSkgKQogICAgICAgICB7CiAgICAgICAgICAgICBvcmRlciA9IGdldF9v
cmRlcl9mcm9tX3BhZ2VzKGNvdW50KTsKICAgICAgICAgICAgIHBhZ2UgPSBhbGxvY19kb21oZWFw
X3BhZ2VzKGQsIG9yZGVyLCBNRU1GX25vX3NjcnViKTsKQEAgLTY1MCw2ICs2NTIsNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBkb20wX2NvbnN0cnVjdChjb25zdCBzdHJ1Y3QgYm9vdF9kb21haW4gKmJk
KQogICAgICAgICAgICAgaW5pdHJkLT5zdGFydCA9IHBmbl90b19wYWRkcihpbml0cmRfbWZuKTsK
ICAgICAgICAgfQogICAgICAgICBlbHNlCisjZW5kaWYKICAgICAgICAgewogICAgICAgICAgICAg
d2hpbGUgKCBjb3VudC0tICkKICAgICAgICAgICAgICAgICBpZiAoIGFzc2lnbl9wYWdlcyhtZm5f
dG9fcGFnZShfbWZuKG1mbisrKSksIDEsIGQsIDApICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9wdi9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwppbmRleCAxMWRiNmE2ZDgz
OTYuLmQ1OGU0ZTIxM2U1YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwpAQCAtMjU1LDcgKzI1NSw3IEBAIGludCBzd2l0
Y2hfY29tcGF0KHN0cnVjdCBkb21haW4gKmQpCiAgICAgfQogCiAgICAgaWYgKCBNQUNIMlBIWVNf
Q09NUEFUX05SX0VOVFJJRVMoZCkgPCBtYXhfcGFnZSApCi0gICAgICAgIGQtPmFyY2gucGh5c2Fk
ZHJfYml0c2l6ZSA9CisgICAgICAgIGQtPmFyY2gucHYucGh5c2FkZHJfYml0c2l6ZSA9CiAgICAg
ICAgICAgICAvKiAyXm4gZW50cmllcyBjYW4gYmUgY29udGFpbmVkIGluIGd1ZXN0J3MgcDJtIG1h
cHBpbmcgc3BhY2UgKi8KICAgICAgICAgICAgIGZscyhNQUNIMlBIWVNfQ09NUEFUX05SX0VOVFJJ
RVMoZCkpIC0gMSArIFBBR0VfU0hJRlQ7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZf
NjQvbW0uYyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwppbmRleCA0MmZkNGZlNGU5YjUuLjhl
YWRhYjc5MzNkMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAtMTExOSwxMyArMTExOSw2IEBAIGludCBoYW5kbGVf
bWVtYWRkX2ZhdWx0KHVuc2lnbmVkIGxvbmcgYWRkciwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCiAgICAgcmV0dXJuIHJldDsKIH0KIAotdW5zaWduZWQgaW50IGRvbWFpbl9jbGFtcF9hbGxv
Y19iaXRzaXplKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBiaXRzKQotewotICAgIGlm
ICggKGQgPT0gTlVMTCkgfHwgKGQtPmFyY2gucGh5c2FkZHJfYml0c2l6ZSA9PSAwKSApCi0gICAg
ICAgIHJldHVybiBiaXRzOwotICAgIHJldHVybiBtaW4oZC0+YXJjaC5waHlzYWRkcl9iaXRzaXpl
LCBiaXRzKTsKLX0KLQogc3RhdGljIGludCB0cmFuc2Zlcl9wYWdlc190b19oZWFwKHN0cnVjdCBt
ZW1faG90YWRkX2luZm8gKmluZm8pCiB7CiAgICAgdW5zaWduZWQgbG9uZyBpOwo=

--------------ekj7blkzKlXEAVmyXxnFbw53--

