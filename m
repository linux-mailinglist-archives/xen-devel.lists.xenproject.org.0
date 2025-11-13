Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D927AC57A79
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161549.1489475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXOJ-0003U7-T9; Thu, 13 Nov 2025 13:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161549.1489475; Thu, 13 Nov 2025 13:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXOJ-0003S9-QC; Thu, 13 Nov 2025 13:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1161549;
 Thu, 13 Nov 2025 13:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJXOH-0003S3-HB
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:29:33 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c940e19e-c094-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:29:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7186.namprd03.prod.outlook.com (2603:10b6:806:2f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:29:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:29:28 +0000
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
X-Inumbo-ID: c940e19e-c094-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMTgFBDaZLjOTuShpUXHAcRbTSieiMcZGaCY2WTEJbqRbXGlifQAqDEr28aliVRVvYqe12gzz16LNoYQykeZzSbvNUg/WMjEnkUfPvNNG6fyRirjfzz/HdfL3WgSZh852C5afXGB2gdfs3gKaY47EdYgltkvq6zCJfHPANlfKo2z0VfWcYVT/6fDOXI/mRia42Gp04ypdUwyAxZL8ocg4/vr/bgNxySrn3B9GPbjawQT7tEc4G/DTqVmO+Dre23jWft/UokwDVd/HduarA7V/qz4fLV1LbDxeCDUa9WHrXU/DlZKHhQFhp/Zdhqsifq6/7a9GzeOl11/h+U6UlafLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uqRDgd792XOHvvC5OFV3guGWSm0xlxwYJMq7JJ3uSc=;
 b=lpVi5MseU1gZ3ufEaAQHo2bDjbq4MqpDy1mPMaY8mLOUg+TJdROe1ck7hDs4CfCRmzL+ClQt6Q35ZbahGDWaLc8LiFMBZxuKhv/uIeSCfuWYOg7q0sIRjqC9GZsLinjzip/bzkD0I4z4IwyXIoJgoj0bd/pZTLr8/mpFwESPPCpnacLwa0hCOUqmzerhKC1ADcjXxgpcO+moa4Q5qbb08U9PXS64Ci3jiFynoyIH6rU2VwhyS5Mm5m4LLdkQe5BGK/H64A+iGzWX0YXZ5q+1UnDlF2zKLET6Rf9WcmpooduDyMORY9i111uW3Paei56YsglBxGLlqmtOhSkDps0GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uqRDgd792XOHvvC5OFV3guGWSm0xlxwYJMq7JJ3uSc=;
 b=AgtbhqGRmccOFQryI0P/uF6VF659pFpfh8VIbAx0uben42c/1KxvSppG1yBF6/+svBk/COPr6haxBRmLK+b4WEITTnlN/WGARAW67uJJ07ssxjJoGrD7iOoN91EdWHHTolWwCK9faGtxaqPKrIln0cOHp2F05RuzwDnMgLHhD9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b0d1b91a-a9fa-48fc-9546-b481c75ee185@citrix.com>
Date: Thu, 13 Nov 2025 13:29:25 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] mktarball: Drop double-processing of the archive
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251113130154.220139-1-andrew.cooper3@citrix.com>
 <ce976661-927c-44e0-a478-893242bacba3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ce976661-927c-44e0-a478-893242bacba3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 989ae4ce-74e8-4e85-d906-08de22b8aba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YitoOUEzeTZSWmFQak44ek1IbmpqVUUrUjlTVHcwRWF1MmZZVUdHdWx4VnYz?=
 =?utf-8?B?bkE3V3duZnA1VGFTa1lnM1N5c1V2bE9sdSt4T3RpRlRRSkEvQ0NYenFhTGxn?=
 =?utf-8?B?MVBvUTl2aTc4bFV6MUg4SUVNbCtuVENJK3BRMW5HdGZaeHd1MHJYeWtWOU9B?=
 =?utf-8?B?emFCc0orT3FJNWJKS2N4RjVwTFBhSEVXUzBuNlZHcTNsbFFwcTRNa2gxQnB5?=
 =?utf-8?B?NEU0Q1MrVk90bEN0aGJ1WERDWkh4bzZza1QvMU12VElSK0crcGlQRlpOSDI3?=
 =?utf-8?B?WWFCUVZWUUxxOEUrRzg5d3J3UUxHOUQ4bURWUmcrcGcxYWNVaVgxcENhdE5r?=
 =?utf-8?B?a2JSM2pDam93QTBpK3ROVVhEV0gwZlN6TXAwaSszRUluSm9tM1c2UnVscXlw?=
 =?utf-8?B?SUV0YUxpSFRXNlAvKzZseGc5bEhaZXFNRUY0TytJU2hmSCtSTTZZL2t3cFZT?=
 =?utf-8?B?UUc4d2M5YU9uM1RLcmdkS0pIV3d2azJzYTR4OXVzaHBKWCt4TE8zWTcyUDFY?=
 =?utf-8?B?QUFsOVR4Q214TFA4Yy85ZEo3Z2k5cmUySDBTWmRPTWpkajVYMFN2Qjk0NGMw?=
 =?utf-8?B?RUlQcnFBek90blpYNE1DeExoaWlQQkU4TWdIVEpsQjZnVURkK3MwejhIOXNK?=
 =?utf-8?B?a1d2Z3ZLZEI1SW9KTHZsTXlKRURzSWxNdTFaRVlIVUtxeWRNeTN5UEpqQnNW?=
 =?utf-8?B?RzdFbDJ4MHdJRjgvUlhocmRXMFJrRHN6VjM5cndUUnI2MTkwYzFkWEpsTVdP?=
 =?utf-8?B?S2RTZzVzU2ZTTkRPK3BadEVMdVhSUmowY0V0c1JTM3YyS3pJRmVxWGpFOVZS?=
 =?utf-8?B?dFBtZk96T2Y2SzJ0UWxUOTZKeEkxQmhWMUhYV1ErQVpMMTNLaDY1a01LZ2tJ?=
 =?utf-8?B?RnRGNEliekxnUEJybjZKWE5MRlFISjJJSFBoK0hiNFdWQnB2NjlQWFpDN3BP?=
 =?utf-8?B?WEhJOWp3cDkwRXVWM0tSUU1tVUQzOWVGMFJubHJuU2VXYmUzWG93U3VwczBx?=
 =?utf-8?B?RmExYW5zMVptQnJqSkdFMHdNa25zZXJKL1YvN1YzdXpaaUs1U0x4OTkwTlFo?=
 =?utf-8?B?cC9XL2hHR0JFOUd2ajFuTXkwNU1xK0NWeVh1TW42dzc2b1hUTmx2L3ZGRGEz?=
 =?utf-8?B?RXJJY25PNG5oODBnZnNRZVRTWGYyN0phSy9NSVBPUDBCaTN0eGhqN01Yakla?=
 =?utf-8?B?a3hNaGNCSkhmYUpuYWlqY1J0OUF1bHFyQXQrZ3FESEFXUG9kT3hlY1JmYWRk?=
 =?utf-8?B?SU9XUzEvdHdtU0ZZRWhCYWFTejhPWWJRVG9JZ09ZRktNb244dUtUcXBVZUtR?=
 =?utf-8?B?MHBaZXA1QzFXWnFCMU1IaHlnRFpqMnZReFhDN1hGbzlwaGFpaktSanZPMllw?=
 =?utf-8?B?Q0UwdUdwWEFMbWZpMCsxQXgra0lUc25xNWR0RElSZVZtTTVjZmhNQm9vTllO?=
 =?utf-8?B?cDZIOXFqWFdOWHVsR21MSkNadVZrTVBPRm1KYTdBZ3VJTzBVdmJpLytDek9E?=
 =?utf-8?B?a0NXVThvQmRMZ2hwazlHQmVEVEJnc1VYMVFSZzVuSFlaM1VyT0FQS3dLTkJt?=
 =?utf-8?B?bDlta2hYRmJIbTM0T1ExUlV6NlYwOWtFa0ptRnJBcGpPYVJocFcrMDdtYXY0?=
 =?utf-8?B?b3NIOEhhYXlrU1dVY3lCUUdEb3RqclQ4MnRwTkFLM0JsSkdsbTVCdGN1Wkll?=
 =?utf-8?B?cmlKUkVPdkxVMWcxU2VOUGZDS0UrV3liRXFxTVVESXZyNFZYWEYwZko4Q0xW?=
 =?utf-8?B?SGFWMVVWdXBCTDhYWVY3bHlCQnpheE04M2dBQWw5enU1WlkvNDg0dTZhN2pW?=
 =?utf-8?B?SmQ5QmMzai9aR3MyQVFpL04ySit0L3hBNFRFb2g2YzBxZlhwTENzKzBNbUVy?=
 =?utf-8?B?OTMrc0xkcmlUTjN1ZGg3YVhCQ05uUGFLVHVweHhINUFxdnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHR0WXRqbkt0NktiQ1I2dzd6NXRnak1sS1k5dTBOaDB5TWV0ZHlSWkdPbFAy?=
 =?utf-8?B?S01OQlhGUEV2L1dkenJsMEdlRUNnZUZyYXJtVHpnRjZoeGRMSm1seXFqWHhl?=
 =?utf-8?B?YVFpaWJJem82anJNUlBHZkYzT1Y4eEhlbGdpQ2krdjY0YWJQMjB5aUlYMVlr?=
 =?utf-8?B?REhUUVpscnJrRGZkZzJTSGFLZ3JZUFljOVNJV1NwTmN2eHZSaTExUHZUY3Fh?=
 =?utf-8?B?eWthL2dyWUp1dnlEZ3N6NkF4VFFGOU1EL01EYUs5WjhYZDBYZW1lQ3l1NXlk?=
 =?utf-8?B?bzF5SUMyTE5BWkxyeUFSTkNUYmErNy82T2lRZ1ArZnNGM0FFMDNGdjNhc3dk?=
 =?utf-8?B?WlVVMTExY25CNlAwRlZuMk0xZy9BRkZNKzhQZE1Rd1JNcGQ3MjFDL3JyY1J6?=
 =?utf-8?B?empEQ21FWTBKNytRazVpc01EYy9tSmdwMHJZL2g4SWhtSlRKWXRiZyt0Qldl?=
 =?utf-8?B?MXpKbFFEWlgwRnJHcEFXb2RLL092UUdyQVB0aUF4K1d6OTFXNUphYnpPUkx5?=
 =?utf-8?B?Q2RGVjdleGFWWk16REttV3VGNkg2cERYNXVEMWxIR3hHV0Z0d1dlZ25mL2tM?=
 =?utf-8?B?VU1vR2h6aDF4RVlPczNmRjlxWUNua0hHODBHdmoweWdzMFF4QXprV2gza21F?=
 =?utf-8?B?eW5iUC9yV1RiV2E3NDNLaVYwR1Q5THdCKzhGQ1FRZWhJdzZnMjBZTFRoTk9J?=
 =?utf-8?B?R3piUTJjQmxKaDE2a1NVUVNYQmgvNVZ0U3l2QkZxVDBjclFnLzhtcEphMEtE?=
 =?utf-8?B?WFAzb1F0VGF6WitKMzlMamFmTHFUMXFZdzlYV2VoUVpBbjBFMzdDa1dxQTVl?=
 =?utf-8?B?SUVFeDQ3Mlo1L24zUUJseTVuVjQxNmFkZjREVFl4eGlsMkE3cFJTUWZFT1ln?=
 =?utf-8?B?N1hhRk1TcThFSW92NHNCdFRmUXlPNDlLMkVGRWNZM2NCOTBWKy9rZllpZkh5?=
 =?utf-8?B?Zm9YS0RjcXl5M3A3Q1VJQ3JXOFpYWmJNTFdCcllmbFFGYXlvZExiQWU1QTNM?=
 =?utf-8?B?MndOenBzZlczL2tqamdkTXlVSXZPYlhDbElnZHB0MFZYSjlaZmlGOVRxU2Za?=
 =?utf-8?B?MzVrOFZlWjk5Lzh2ZTc4aTBhU0IrU2xORnRRaVJvTG4rUi9CdGFGa3FCTnBy?=
 =?utf-8?B?Mzh0VUw0UHh4OElJZXRVSGt5ZWxkZGF6MUp3eFVwQkd4OUljS3Yzdm1YeEda?=
 =?utf-8?B?K1hyN3JNRkg4Z0hQTVNHblFCbHpWU3VXSnZ4R3F4cys5UjUvRzRld1lyVTlm?=
 =?utf-8?B?eWNvVzAwTUZ3a3BkMnl1Rk9MQit1dWtRT1NJM3hSNnhpNXlSOFNMbG9ZTHNK?=
 =?utf-8?B?a3g2RW5vdy9uVVB1QnBqK2c0YUlIbmV6YkVyeGJoNEhLK3dNWmRzUFRISUdz?=
 =?utf-8?B?dU1Gb2J6cGRlVmcwR0VqVEk0Q2Z3ajBOYVU1ZHBiVzZ4b0NnTmxBcEw2dEdJ?=
 =?utf-8?B?eUg0QUN5WGJPUEo0WEVYeVJZUUpKbXRzcVorS29sOVA2RjJOWXhhTjRHWkR4?=
 =?utf-8?B?YlM1d3NtSm9zVWtGR0t6ZmNPSWhEMkZlUmtIQXlmWUJmWkxOSUxqYjh1MnVZ?=
 =?utf-8?B?L09hVndRS0E3YWdWeDQyTjlxdkFPcmdJK1F3T3Y0MGIxMlNOZ2lyU2xLcVBZ?=
 =?utf-8?B?TThnMGplL1VibTFGMTdFMllhNG5ialZyVVEzbTd1Wk1Vb1YyclRuQ3BQU2xJ?=
 =?utf-8?B?YjhrbVFTQ1FvZGp6SEFyWTlpMWY1ZUtMdHh4c2JSemFqVmpwNzhsb0dXanMr?=
 =?utf-8?B?dzVRcW1IOFZldEJJdzkrS0V1RC9na1dWeGQyQ2NWc0NRZXFiZy9IaGkwWTZB?=
 =?utf-8?B?WmFremo1aUNMaHAxK09PbXkzdU1iR0ZFOXNWbHNUVG1ESk1INkFuS1ZJZStL?=
 =?utf-8?B?WDFFcmNhNTFvV2RJTUx5V1pvUkhOaitwYmh1ejkwZUZ5MkVqTVV2Rmo0U0J6?=
 =?utf-8?B?N0VsZjJaVDhDTXVIVlhJWU1rZDlpdStiZ2JxRlR4ZzVJQ1ZjNXFselFTVEw0?=
 =?utf-8?B?QzJjYVJOS2MzZnhwSXZlRjhrSU1QRWNMMDJ5WUZxZnR5cCs0VzAxRmludG5Z?=
 =?utf-8?B?ZDhPQUFEcFVtNlRMZ3doWmVoeGlTOGxoNC9VTXJtdVc4SXRrNHFWVHVobjE3?=
 =?utf-8?B?U0VJVldFOVFMMG9xMSt5YXk3ZmhNdlB4Q2FXenN5emU1c204Q2U4ZDZPY1pz?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989ae4ce-74e8-4e85-d906-08de22b8aba5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:29:28.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k28sqQYqXR3niHApmCkhGUehDuOwmlTkdHu4Y0JMdKSoNAaXfJlWzD7RZb3THKs+sJ4NFKY9jOXXwnLOMivr+tGomGc/8AtwohDT/DwSlYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7186

On 13/11/2025 1:12 pm, Jan Beulich wrote:
> On 13.11.2025 14:01, Andrew Cooper wrote:
>> This is a partial backport of commit 63ebd0e9649e ("releases: use newer
>> compression methods for tarballs"), but keeping gz as the only compression
>> method.
>>
>> In addition to efficiency, this causes the tarball to use root/root ownership,
>> rather than leak whomever produced the tarball.
> I don't understand this part. Isn't the ownership whatever "git archive" reports?

This is fixing the issue you noticed about internal ownership:

xen.org.cvs/oss-xen/release$ tar tf 4.20.1/xen-4.20.1.tar.gz --verbose | head
drwxrwxr-x andrew/andrew     0 2025-07-10 12:28 xen-4.20.1/
drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/
drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/workflows/
-rw-rw-r-- andrew/andrew  1362 2025-07-09 14:57 xen-4.20.1/.github/workflows/coverity.yml
-rw-rw-r-- andrew/andrew    96 2025-07-09 14:57 xen-4.20.1/.gitarchive-info
-rw-rw-r-- andrew/andrew  9668 2025-07-09 14:57 xen-4.20.1/Makefile
drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/
-rw-rw-r-- andrew/andrew 24220 2025-07-09 14:57 xen-4.20.1/stubdom/Makefile
drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/grub/
-rw-rw-r-- andrew/andrew  2252 2025-07-09 14:57 xen-4.20.1/stubdom/grub/Makefile

xen.org.cvs/oss-xen/release$ tar tf 4.20.2/xen-4.20.2.tar.gz --verbose | head
drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/
-rw-rw-r-- root/root      4781 2025-11-13 09:51 xen-4.20.2/.cirrus.yml
-rw-rw-r-- root/root        97 2025-11-13 09:51 xen-4.20.2/.gitarchive-info
-rw-rw-r-- root/root        30 2025-11-13 09:51 xen-4.20.2/.gitattributes
drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/
drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/workflows/
-rw-rw-r-- root/root      1362 2025-11-13 09:51 xen-4.20.2/.github/workflows/coverity.yml
-rw-rw-r-- root/root      7035 2025-11-13 09:51 xen-4.20.2/.gitignore
-rw-rw-r-- root/root       798 2025-11-13 09:51 xen-4.20.2/.gitlab-ci.yml
-rw-rw-r-- root/root     15298 2025-11-13 09:51 xen-4.20.2/CHANGELOG.md




> I have to admit though ...
>
>> --- a/tools/misc/mktarball
>> +++ b/tools/misc/mktarball
>> @@ -5,14 +5,6 @@
>>  # Takes 2 arguments, the path to the dist directory and the version
>>  set -ex
>>  
>> -function git_archive_into {
>> -    mkdir -p "$2"
>> -
>> -    git --git-dir="$1"/.git \
>> -	archive --format=tar HEAD | \
>> -	tar Cxf "$2" -
> ... that I'm unaware of what the C here does. It can't be the same as -C, and the
> --help output of the GNU tar that I checked doesn't mention anything else at all.

It is -C.  tar has dreadful cmdline syntax.

An equivalent would be tar -C "$2" xf -

~Andrew

