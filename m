Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A763A664
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 11:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448868.705435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbih-0006eI-4Q; Mon, 28 Nov 2022 10:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448868.705435; Mon, 28 Nov 2022 10:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbih-0006bj-1T; Mon, 28 Nov 2022 10:50:39 +0000
Received: by outflank-mailman (input) for mailman id 448868;
 Mon, 28 Nov 2022 10:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozbif-0006ba-Cj
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 10:50:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 791cd105-6f0a-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 11:50:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7140.eurprd04.prod.outlook.com (2603:10a6:208:192::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Mon, 28 Nov
 2022 10:50:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 10:50:27 +0000
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
X-Inumbo-ID: 791cd105-6f0a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R03t4IviUH3fKxonQfzlCon5hbhNTugrK9eP1WYqI5eWdYdtkInFNlJWDWoyWcXNh9QeToSAo/Jd43HOBkrXwl7pnML1gMvEn5POpbRR+EhJswgWGphbkmMTolVMO5tSRCtive08i/ogJdTfFUrLJv1xyCilXw/temlVoDztx7CoOcYehJXC1+uZB6o3vCKNOVBV7QFafByenjnYPhuz0PdKlwAEUcwmeqmWxgFuq+Ad23FTlmVC9ETWi88ftUJ0TszUEFmnVSWzLdU+bRPAKOq+lM1gPFKP2BttYP8+ZCXZCYLuIcmHlgg3gYdP46ZX4rWLJ7TR0TmaV19p0JFnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmFUEpVACQD1Fe9TwDU4e3aRLKk5K/g+oMeR24yN3dg=;
 b=EwBOAf5udVmvsqJTvs3+rqrj4Gk+qJVKtMMJib5v3DyZWiifVhyVwKb3W7RKDne6shREFkb9c+GLJuL330RqfHMHc99wO/DSyOOHihKdH4pA4bForg4WLQWhL/JM83t2Kx+zKSfQdGw3D2JR7wOW1ZiE5EyyJw6zfheSNhuWclowTPvCc7vpY2pL+xCyOQZRc/ieeiphS8i46cftSS6HGxkOCc8ofFnzMir57rwpsm5s9RRx/lU6QExqNYtkV1Xi0e7gOHzRtZtHa8MLEjShFxk0Vlue0FfnoloKX6HhH0sbI324Zf8wN65QtYMBOwWi4/Obt2+H1HYK3EGJ3q6x0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmFUEpVACQD1Fe9TwDU4e3aRLKk5K/g+oMeR24yN3dg=;
 b=mifkqRaImMdoqkAgJn/26csno4PTtqQoZwG+4io2SBBcGEIVBOfGB2VmXBanUWLMIdMwtZbG2OJf0rbIo0/wmCdd1ut5mJW0cLzya4GEzXnFQEylRUYX1Hd36RP6COYHveAgpnk+n/pYgYWA9MNkpv+07gLRsiFSgHJPeul9ZdLwxrTKBiAwK5TY7XBUtbcZJpAddMFm6er0USbzYrtLZ4h+dHCNCwqqecibVeGckheel3cuvENiXlFpUiSwX3gyWyExDhjNNn+kOW0RRa3ufiU6hguO5U/kHWhb1muYELl0vAbPR6NsFZ1pAohEU6q/AfX0G469ZPKclBIqMRORiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
Date: Mon, 28 Nov 2022 11:50:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.16.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: adbe15b5-fcc9-4f96-76dd-08dad12e5c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BCLfWphFvLJHZZPlBN+R3CG+jVY0zeQiMSlfLTwwmQ1SFqLcnBrkb7qHVaTfisg4xgHnaJJJ3d0jB0oCGVNIEXrQ6rjPP0IwBgy9FBZSTmtU+kerd0sigprOiANxDRnYeprpVRhDkcTcPv0FMm6sd6G88n4iVjn9q1ficFyDK0+9ZUT684VJ7+I84J3QDFwSFn0Jt0uDzaM6Tlx0cBlEcOsMTVjZyaP73dk114TLfAg5o8pnxqfY2n8f+CedfpZ9zQ1e/p60qoa+KTBrfy7sIUAUOy4u5U0FTcoJrI7C6ZiXoSLzlShDz6uz23TosRsH+9rsRn51ZwdfUXwVr946mENWjVzd0SZgFqLuP8vyVAqoMsTs5oFId1jIucaY+n8BxTwdG9dhOxNaTq02SNGESkxiVip0I0llrY7EzeURl3QZFB97R2HXl+FpYNpc6qhj12doeQPyo/PiMqGR8r3nBjCtSXcNqqHTAeXlqMU3qgDusbpPh+VRibAJQTA5PYX7DN4PKYXyj/0ICpiGDbr6fMr3C2UuxKsklLBODbp45mGM3MJaCdm3nle+Iy7ko2aZ4cv+YNlJlkTIFWF4cu6XTb/pIrqQrz805e/WnWdEHz72mi9YK94z6Nz1YOzKriz1gQchCIRQYnv2V47+JcAnFB7w1bedz3e6f9H5TS6ASDdoUxEiAOiNfyfifksIyCAQSnD2gVWiPN3rSyhLlFcP9ZWZmzqE3L3gbrhnGbeg57A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(31686004)(66899015)(6486002)(66946007)(6666004)(6506007)(66556008)(316002)(66476007)(41300700001)(54906003)(2616005)(8676002)(26005)(6512007)(8936002)(36756003)(5660300002)(4326008)(186003)(86362001)(38100700002)(478600001)(31696002)(558084003)(6916009)(2906002)(7116003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkR5RVRLY3FMdkNveGtkNm9BUUhTQ1Rnbm5BTzJES3VobXFnaFBIZGlNYk9a?=
 =?utf-8?B?M0hsQXVITzhERlNJdk9qTE5ybllhRzJhaVNMMStHSFp0UmtmNEV1eEhhd2s1?=
 =?utf-8?B?UjFRVmNBUk1jUVJTTjF6V3owZWJOUEhWdEpkZ0pTV2hNcWxybG1neVBKMlk1?=
 =?utf-8?B?KzlDQVc4K3FQdjZ2WmRZWjZBMjNFTHpTSkdCb2xXZldCL0tKZGpCSk81RW5R?=
 =?utf-8?B?ZytQRjROWmJSa0tSY0ZOVGZ1U1RwaDBod0IvYVVxaFViODByWGk1OU5jNUwy?=
 =?utf-8?B?OW9aRVVtMk9LeVI0Y1JlV3R3MTRTL0NhcXhJR1ZiT1UzZGdiSWRkMTZnVEMx?=
 =?utf-8?B?MmRMdHVsemlYemI3aUp0QkNEM09oZGpvcFpiUHlURTNZMkhDWU9JZHpNSkFj?=
 =?utf-8?B?M25PbWpEMFZJalV0cDRPRFFXVmZWaFVsSlNvTk45N0F0a1h4RzZaSVl1STR2?=
 =?utf-8?B?THp5SHNMRHRUclBtNVpyYVoxeUZObmtIZFV0NWJZb0lML2ZoSG5LNE41NUdz?=
 =?utf-8?B?dUtlc3hGL3E4eUR0dmdVUWlUUE1KZzhadXNGRkFaMlRwVmFrQlJVT1RIN0xs?=
 =?utf-8?B?R2xRWkxyK1dKQURyNG9Pa0tEenpVZVJWdUEwMUlPbGhxUGkvMGVGRnJDT1hR?=
 =?utf-8?B?c0lQOWZZTnlDWktlcWxyOGh1dmliM09tS2RDcUEvYzg2NzRpdFN2bUE2b2x4?=
 =?utf-8?B?dmlUNmEvcEw5cGduZXdVL2pudjlETEx5SlRibUROQmFiZWs2L1E0T0Q4dlNt?=
 =?utf-8?B?dnhkeS96ZzJZaW45RFdmZ3NFQVk2bUl3a09KQ3dJcDQ3bDJWZDZtZ3V6SFMw?=
 =?utf-8?B?U1crUFp2OUFQcU5qMS93aHg3U1pvVU5pQkRDbTZhRFp1OWxqTjd2cE5VTnh0?=
 =?utf-8?B?Q0JuaVZWOFN2MVVvdW9Ra202M1VRKzAxaEtmU3hqbHhyMEIwSWR3UUhienhP?=
 =?utf-8?B?UWoxZjh3SHV1c041cWJuMzgyVGROVEU5WVFtOHRDRU1LUENMQ1ZEeEt4b0F3?=
 =?utf-8?B?SHNTdFlFUTJmR2tDTkozN2hMbFNXc2V1MCtLOVlsREFzUkxNQUZIWlBSVzNG?=
 =?utf-8?B?d0E5Q3hDZlEzenYzczRNRGhtSTNKSmpESDdJSVczdHdpa0p0K3Q5N3QrZ2tV?=
 =?utf-8?B?TTgvam9JclUzQXZZdzZLelNldnE5anlFbUt4ZWFDNzBVNG1xNFEraTZRWE5S?=
 =?utf-8?B?UjJrNHRKcU5KRDB4YWtSZmVSeGhaTkI1YkRDWDVDMzJtTExSTVZjcC9wMzkx?=
 =?utf-8?B?MlpJVm5NZnozWnVXZUFZbEdqL3V2QlA3TkFiUXU3S1pNdklON2lnaGw5UVQ2?=
 =?utf-8?B?WUZJV1lacFluZjIwRGpMTHJoSnVGc2xkWmtzUmNtZnkwY0RFSHNRbHNEc0tO?=
 =?utf-8?B?ekgraExiWmtxU016N0FZR3ZzYzlKNnFvazgxMmdSc2lXUWJHamVyUFR2WTND?=
 =?utf-8?B?N045YnRCUSs3QktYcTVDejVpT1lCMURJRkhZU1F4cGZtcGFxbGNGanVHaHRZ?=
 =?utf-8?B?VW9SL2tQZVNTWGRmZ2cxeG5WVi81MjhjU2k4cWtjN2JiK1BZUDRpQWhDWkwr?=
 =?utf-8?B?aVpid2dFQitPajlLdkdCeUkzbTVDQi9BbWJCQ0cvb2hOUENENG8ySGtJcVBC?=
 =?utf-8?B?ZWFxbWgrOHA1QUdkUlBybWt3Z1d3MDI4SG9OWlFxaHdiaE9iK3o0SnV5QkJ1?=
 =?utf-8?B?ZjJZUXFzdmhhK2s4TmdBZjhNR0VXMFZNeFpJSzg3NUF4SklKUHp2OURUdjZj?=
 =?utf-8?B?VlhKVENxNnpBZTcxS29vbTg2RGVFNGd2TGpNdmhEN3VjaUFNRldFTXREY1hK?=
 =?utf-8?B?VmhqTStFUEd4ZHE3L3k1SlhYaXNMYXQ2SUZEVEgxQ05LdXgyZDNXSEFYZ1hp?=
 =?utf-8?B?YzVrM2FrTUZNNVREQ3QwdUZ5WnhCK213RUMxSEpyTG10WHAxZmNhUGdFYzRl?=
 =?utf-8?B?LzdHc3FVTlI2ckVvY0wyTUZmOWhnaFRBbUF1ODNFQVdodEo2bmN0SGRYOVZJ?=
 =?utf-8?B?RVF3Q1VDWGZOTHFHYUpwQ3JyNmVNczFnVUgwU1BpQjladXNuTnE2L296TFFI?=
 =?utf-8?B?MlVJWUlBRXE2dUV1VGp4U1MyWkJjeURrRytyMTRzT0F6YnRXN0hQYWFSUnd5?=
 =?utf-8?Q?E+7DlCUCMT4JayWhY2HghtnOC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbe15b5-fcc9-4f96-76dd-08dad12e5c37
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 10:50:27.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOVA8I7v9NJPFDvRYRQrU82ULgU+8FPapJ3AHxduGkMHDhj9GNG3/3kiFHBz5/OEC4ZOAOF46CdPDPvUhms1cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7140

All,

the release is due in a couple of weeks time; ideally we'd get it out
before the year end break.

Please point out backports you find missing from the respective staging
branch, but which you consider relevant.

Jan

