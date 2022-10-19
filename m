Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A6603E01
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 11:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425687.673669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol55s-00075S-SF; Wed, 19 Oct 2022 09:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425687.673669; Wed, 19 Oct 2022 09:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol55s-000721-PJ; Wed, 19 Oct 2022 09:10:32 +0000
Received: by outflank-mailman (input) for mailman id 425687;
 Wed, 19 Oct 2022 09:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol55r-0005xH-9z
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 09:10:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d293b7-4f8d-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 11:10:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 09:10:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 09:10:27 +0000
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
X-Inumbo-ID: e0d293b7-4f8d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDTVYknjCo30d6W/D4gRIUGgggo+ukK5DN0rn2eRVO9JPE8/IYbBQTnfpAXVuMjH82HpP7x/Xx0i4TzbQskY73XtBBBhyYkaoAQeWDnQQ//pqQgJ6wJ8uxmGUi7WuraKuvDyXOn+eEpfPtjAaqXoqZTeYrSz+04dXBA1I3gHaNhk9ErIYzwjED3kQrwSMdy9+/BY6aibNnVXlat0sSd/2pW3JEfSey3mKGERtuzFJIaGzhRlLEkziDo/gXdKA20kzYawWdPKsUVroucuIM8/ar8dY4YxFOLbcgSrJH8hzIW8FmkH/guoN3lrB/qLmKE1vYW0Ef1+L5evzfMKMwnxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MloKwlUFSPntwzhcL0PjnY/XkLE3GPSbgNrfJeplII=;
 b=OFrtm/+bttC1fctpc+PSDEQ3sjfvwckoNmGhob69fHRYw32lTm/2J9F9Xr3GKUvnUl1nqr5UtLcFBfUWN6lc4BMS/QRxdcysD9r359Chfp6TK47vRHyhf7ul7xaNNv8RJeXUDgB6YqVfYtyj10+Wi94zRak2OzeAM7U2j0lLD3jFqqTnZFbW4TToPBUR1QnEPPUhfH8yWzJh68kbPy9AAUM3pXtjbXiteWq/Zn7HxWly3DpJOBf58dji+w6Fh7KGPKvgOaEzBOROnz6Mtwy2gHa/LQHFYxMInc+5yOkk/m30aEpulcq2OT4P+AvPhtMGohcpvrSMnmU1X5WBT5tdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MloKwlUFSPntwzhcL0PjnY/XkLE3GPSbgNrfJeplII=;
 b=N43WCyklMzqPAR983Zesz2Pjcw/hKUxI9OvzxAkVtoVOK/ZTPMSSMcFF5WArb5VdX20WfYjkuVM6KVXCwHQTMO1EwX0Tm5K9KzwPa4MDgxA+lLQcSMHOyftWgh5ojwmCoGbLIEh/PuDUvwrUhmmGcEZ7LGEvtl/8Rg5JVbK/OWUzPU+UXYJG7xXmT4/++DnXyUlYLiWG8KPdedZRPGOVMNI9yo672i494HRgAoNaynccCB6lGSBlKMJCvDy+bG4qd8qEQI953lzkqFeqgJ5kzYoyG5EV6ETMWTOG+O/aCHyIQMC6HHXPJ5WBockoVkShhKNRcgcLvS1Ti/Efuyoy/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc4414f-1009-2073-ea56-9b772a7189b1@suse.com>
Date: Wed, 19 Oct 2022 11:10:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2][4.17] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <1dac86de-cb8c-d2b2-d0ab-bf76707d22d0@suse.com>
 <9c407e09-4af8-b021-293d-b1db8a0ca4f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c407e09-4af8-b021-293d-b1db8a0ca4f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 9527f916-8c94-4ba4-1b77-08dab1b1c399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEyPpE/kBa5quD2SEX0ydABNr3bzbIVi1dxBNbpSor3RS3F+mF8Hg+xjegZVoqiWKXYhO/QV492Tbxkn4SsTADvUAq5Rf9QCggJ2GD7atPbo+KbJxz8Jx7zut6CNfoUFto6jVa2z0xCUIZjUpMYUR5fk64508RM/e5PEb9+Oy34EVl4fG9zlzmTaxTlo8gVXWtJuvlzmBHyS/xj21nMlrMy7UcCbCCx7cFfwTd9HqtiIUMnHsz8JgqQO355uSMc1bokpsiP9q9bbbg66NGjeeiW9ZhGL9/Tx2epbVpZUaHRrpf35aK2lypVCeq3qHENAiD+Fl6ttkzgGiXKHwfd7v94T62ItFDju9gZ3yyAXxXyOguu6fND/HjjygecFWUNw1hihq1tkM5HAOA3msmSEgBspT2My4xeVJcHI7zJk7RDibvGdVs+iZs98OC8RdON7OekO8WmWdVaKaTBYwd+SfwUv8Pts1QJ+DkE1VdbRc00vw93KLbOnmGoHoV8bfmnYl/c2x8c9O3u5Q1AOsljDrS9k0EEq0GbABeic86ouTpHHuRV62KtK17X6oOBzhXaozIFvvuTbGncDuFSjNT+D8KC5r+Jlm2X8ledcjOXflnGxwHz6OT7bm5iOqYTXRfDSBOWQ0JZjUm+R+pea1qsUU844VAHY65x1v9zHntOB0AVPIAXmgNpgRfoyo3yKjFRrh49y0sV1qmwxFSXVsQeqCEnKPKIPr/CsdOMmfhSBFxHs3ERD0WkIRsaz8FFwiXyD0ugQK5DsOKRWnfjyzjoGpU2YtXHSrK+LIEHzSd+BUH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199015)(83380400001)(36756003)(31696002)(86362001)(38100700002)(66556008)(316002)(6916009)(54906003)(31686004)(5660300002)(8936002)(186003)(66476007)(2906002)(6506007)(2616005)(53546011)(66946007)(478600001)(6512007)(6486002)(26005)(41300700001)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWRVa0VFRXVqVGk1UGw5T1RrUmlxTDFWR3pqYTJDQi96dXZkb29pMWptREhp?=
 =?utf-8?B?SnRoOUNWRW1INWFnT21rRm84TTFlWkprWThPWHpiUU5NRlErNGpjOXZYUCt1?=
 =?utf-8?B?eTNRUElEejJ4R1RKaGFKMEU1VmdOWWZPY0pHV1hWNHhpYVVDaUlJa3RGSUtG?=
 =?utf-8?B?RHdFcnUzUXRoUE5ndVJHQWRWeFZXWENRNGl3MDZmNXFEczdwVzJGRXBzQncz?=
 =?utf-8?B?VHJBN2xXQ1VPK1orNlhEYi94b1paNCtPVXZyL0ZJWGJvMkFpNWxFb29RR1c2?=
 =?utf-8?B?WnF3eTlJb1NNUEJPQnVJTjluODcrSjB5WjM4YzFPSWFYNy8yUlBtZlg3NzJQ?=
 =?utf-8?B?WkZzR1BUM3FnWmkwUlVRMWJxVERvVytReG5GUGJvekZyRzN5Rk10NUxzZTBL?=
 =?utf-8?B?eTVVV1A5NG81YVNhSW9mV2R5ZWVBalFXaHMvYWZJaVdpSjJHMDVFMUk2Z2V1?=
 =?utf-8?B?a1VVNG1xUkxoZDh6SjVlTjczc0Q5cThMYXNycXRtUktJcGFSWFJZNkR1bW1V?=
 =?utf-8?B?NG5TZHFjN0RUaVhiMDZBc3NOd01kZGNUNGZIWWdBSkJwck1jY0s5ajFvek50?=
 =?utf-8?B?MUNwbmlSNlNsK3BRTVd5ZDdKbXp6TWw1WDVmc0ZFeEZDNUJwVHVDSHpYTmNB?=
 =?utf-8?B?Z3JkRktMd3FPdGJ1Zk1mUjVPTjJxeWZtcnNFTnI4cWl1TlVaN3k2K1oyUG9l?=
 =?utf-8?B?RTgrMlV6S2J6MFNGaklvcGg0K0hpK3F6WHVnaDU5MGM5WEdtY0JYdTB5Qkpi?=
 =?utf-8?B?SHVVY1QxeGpobHJISGpBckYwNW5CcnA2MGo0ZEtjdFU3WGQzeXNYOWtiVnhk?=
 =?utf-8?B?NjdkelhCUmF6THp5Q25TYjRvdGFYVW5STTBjY1BSWUpsYk9RL2NKRkZYZUxz?=
 =?utf-8?B?VmhvdHN0dzdBMTV4bUxhWmhPU1JDem1xREpHbmJxa1BSRWpPYm84bDNMaUlI?=
 =?utf-8?B?NENjeThZdDB3TVl3eUwwWE4xRVozS2x5RURuWFJ3T24xRlpqZ24veEgzTDd3?=
 =?utf-8?B?SElKZHc0YndFTG81RE1vLzQ1b2xUUDdKWC9FL3V1LzdJK0pRZkFDNDFxdzlQ?=
 =?utf-8?B?bXRXRWxDM0R1MUd1SEw3bHErbFR4dHZ6MFJyUFl1cUtxY0pWWjRnS3FXY0Fx?=
 =?utf-8?B?dnJRSnhLY1VXSmRGQnJKSDRXNENOYlBtQmZDRkw3NC9KbVpnbFFoSEM0VjVY?=
 =?utf-8?B?L0NhOXJaS0NjdHVEREZ5R3dWWFBFTkFPQUNIZ1Ixa2VwMDZrZXBraEtSd1B4?=
 =?utf-8?B?SnZpbFB1MlRUVGV3ZjFRdUZLdVJIaHdrbzNkSzBSNHNGOVlXTUdBSERsMVpi?=
 =?utf-8?B?T1htV1ExS0JDV3l6R29hTDRKbm96aFdjaTIzZytJR2ZWZzJSdjA5MENRYWRQ?=
 =?utf-8?B?czBhU1ljZjJQOTNkOGsxZHJTRlBrNE42U3JQZ0VmdUlqbjBDck96M1RRS3py?=
 =?utf-8?B?SzdHcjNmRGhucTZlUTNGWG9mamlvdXFSR21IOU1LcTdwdDMxUzM1ZGFOMTF5?=
 =?utf-8?B?R2Z6QVp6MlpoN1JrWG55RGV3Y0pzbk1kUVY1RzZDSzlEM01tKzRYdEZDYVB3?=
 =?utf-8?B?NFF4YU9hL1JhdmpLMHpaMjAyR0p1T1l2UTlJLzRYejc2TGtNeGlEL2Qra1ZF?=
 =?utf-8?B?aG1tRlVRN2EzNi9nL1BsZTIyNVcxakVNVUVTQ0hPUXF0NUxxck9qdXRybjFH?=
 =?utf-8?B?MXZicHlGK2FwYmt6MlRWK3U5bllSSE4xdGNpbnFmMnB3U3REbmtwYXdteUZm?=
 =?utf-8?B?QWcrSTEwVFlWQ1FUTUlKYTdwL3Bjdy8zaUZ4Nk9tWlUzUElkNGNGM0ZKNVlz?=
 =?utf-8?B?Z3hEVkxOSktvQnl2U2pWbzFEdEkxVTVNTTFzdGd3NnZBaXErN0VOSVdpaXpO?=
 =?utf-8?B?R3hQMlFmYmxySkQ1SEcvaU1wMmdabGZCaUlmSzN6NDFCVld4YW9UdWFKZzF5?=
 =?utf-8?B?K1Bmc3A5M3ptL3BUOFZXMW9yVUNVNU9hRzRJUGlGejZadHgyN05ZeXJ6VXp4?=
 =?utf-8?B?YVpiSWk2aG80OEsxYTVhMXhYaXZGSERpZjUycW9vdis0SE9aS1ZHUkc2U0JO?=
 =?utf-8?B?M2MzQXRVOEl2T2o2aVBMQk5GRTE3Sk1mVEZrRzFFenpnNHhXRjhCQys3UXlu?=
 =?utf-8?Q?CplIVyCxllcIPwNsRvA9B49oV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9527f916-8c94-4ba4-1b77-08dab1b1c399
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:10:27.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzJdbABzPPnH9cg6Qv76JD+PWXov6aOCLtGVtA32iqByFXueHZIvjt5tKXsOC0hwN3gHiEQ1z31t1q6h5YmG5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441

On 10.10.2022 20:56, Andrew Cooper wrote:
> On 06/10/2022 14:11, Jan Beulich wrote:
>> In an entirely different context I came across Linux commit 428e3d08574b
>> ("KVM: x86: Fix zero iterations REP-string"), which points out that
>> we're still doing things wrong: For one, there's no zero-extension at
>> all on AMD. And then while RCX is zero-extended from 32 bits uniformly
>> for all string instructions on newer hardware, RSI/RDI are only for MOVS
>> and STOS on the systems I have access to. (On an old family 0xf system
>> I've further found that for REP LODS even RCX is not zero-extended.)
>>
>> Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Partly RFC for none of this being documented anywhere (and it partly
>> being model specific); inquiry pending.
> 
> None of this surprises me.  The rep instructions have always been
> microcoded, and 0 reps is a special case which has been largely ignored
> until recently.
> 
> I wouldn't be surprised if the behaviour changes with
> MISC_ENABLE.FAST_STRINGS (given the KVM commit message)

I've tried this on a Skylake, and things don't change there when forcing
the MSR bit off.

Jan

> and I also
> wouldn't be surprised if it's different between Core and Atom too (given
> the Fam 0xf observation).
> 
> It's almost worth executing a zero-length rep stub, except that may
> potentially go very wrong in certain ecx/rcx cases.
> 
> I'm not sure how important these cases are to cover.  Given that they do
> differ between vendors and generation, and that their use in compiled
> code is not going to consider the registers live after use, is the
> complexity really worth it?
> 
> ~Andrew


