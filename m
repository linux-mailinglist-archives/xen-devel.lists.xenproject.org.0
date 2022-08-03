Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BDD5888D9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379668.613310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJA47-00012z-Ob; Wed, 03 Aug 2022 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379668.613310; Wed, 03 Aug 2022 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJA47-0000zX-LY; Wed, 03 Aug 2022 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 379668;
 Wed, 03 Aug 2022 08:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJA46-0000zR-3A
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:49:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 284ffd31-1309-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 10:49:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2905.eurprd04.prod.outlook.com (2603:10a6:3:db::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 08:49:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 08:49:15 +0000
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
X-Inumbo-ID: 284ffd31-1309-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V54uwl3sqPJjweGLbeLpXUk9wzQEZp9KKO2i6mBbuhVSJkIUxalJhKsbDUetOAZ2aqXJDxBr9hElhHPFtURSNXfA2vdaDFxGH2vI3dWmT2FrQl2Ae1PlN0yOsP3M5/w7X3ZYanquWfnwHZgIgjEGbgRS7N2UiHeVZon80oYffUkBLFX/J97kdBdp642hZkMjLAVAOn+KkpT46KEkrhFIBk4oVC3VUe/v/NzGrPXzOJT4eYECcguvqpwAetwJkC/qTQarzqqUutuoxMSGXJ/osBDQzhZVUNOdt5/N5JUDR5LlKwTAPmLRwRj8SoEZQJkFE+iD4sMIWZzTB3X/MQHt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9emCuXnKqxW5KkXlBgWfroq0jEpnPyV2AVkSB2KGyk=;
 b=QCtO33Wpodb6mLkQk5wotjnjrnWVEpTSBScFzPFlt1lkBVYOvA8Jyg9ZzYZZDAKVVNL/HmB64h+X4DqbPcM4MIDJCUEoz5H1Mr2W9fcYTbZpuE0NRIeaud7KIrwqViF5oDCZUbPbCGQ0OCRxES+1sRd9J/aVsMSXXeatVhL+szg0d2fPpK2ekFAvfIz3SDrlONz36r2fAeLc9FeKm2rendvvDM+/UBeZTaaPdEqkorDmHZvh1ByVzpFfxl8xlNodS06ud7rig56r15mr/liu9x/BlmufFDkeCR0BCNUtuLpnn8gAW4PgzJhtYT6HODD14hwr6ecTcRRKTSMy5MYQ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9emCuXnKqxW5KkXlBgWfroq0jEpnPyV2AVkSB2KGyk=;
 b=ABVGDaE4jNyaERBSPzxCVN4syQMfo4Cdk1fxr2nmZIVHdOocxv+DqH5teRJt64wzvWH38Nfyg1kUnV7wZR/3VBdE5wxxbN1e16UpNQPo8aSxIJYQWWhcIWFuFlaJIZfNcQtObC08qPkKc1zRwqlxMozaDvFuwWTOXGnl8uCb0fEn4kiMGdDk9pCI7REPzZhncW6I+KF8vMzVTSkWuuuSA51HxDmkesvr8c1p7DvyjgiUsUPnqZBAvyR4nWMVL+e8GLOSgEg2qeVD6rsvWPoWdjNH8Qbdkd96npjgWK5mdhx90vKMS9N/MJtWXS1k+LObx24ObjmTVUP50KocI2nZWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <780f6ed5-24dc-9df0-2d40-f00ea467808d@suse.com>
Date: Wed, 3 Aug 2022 10:49:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Content-Language: en-US
To: Bruno <brunoce@kolabnow.com>
Cc: xen-devel@lists.xenproject.org
References: <9ae39fa1-84f8-401c-85a2-3b6208e54d18@suse.com>
 <2B4EA247-D7AB-4CBB-A03F-966ADBD9A179@kolabnow.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2B4EA247-D7AB-4CBB-A03F-966ADBD9A179@kolabnow.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afe615f9-af13-45ca-65a8-08da752d0b7b
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2905:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GXqfPDrAPwIJc1afbl7KXnj2X6ppC4btwJR7oXdqXE68bNW7Pt/UhKShYQI6q7bjJ566b/F47m0o1tKRhH02ETlQNwixLmtdcEN9unTY5nfMVJ9F+ini3EtUs9qxwzD/T63tArPYFiUzzT53ijGh4mjGefxmKh7Rh1XRiAvxD8tZLIJAkOY3GkG+QdN/tQBiBQm7ICETvsR7ipoiiyJGeO5PaTtEEbBY/oN+GAXy6TL6yuNib/F1wULDlY0ASIgLuF4yjpwQmI0w/AQktM4RFoqFTYxbRUN1Hky89oHsy7DAGk8x/kVBzBtYg38quIoNwagHVS9hS6OMGLPc+ldg3UJ5W96sKH2HTBGD0+npE9EaePZe6jgG56ES/IOrvgcm+JTGz7XR3tAnifOwAbDBhYoUhFo/T3ShvwYr7Y32EsPZSxOiVMG9CtgDL/CyeuISLGNnyMyE8BrU8MZQZRpDIdvQD1c2KP6l9lT/co/MpXMNqdoyUi+KH+YxNyWWOvxMaFzzbj1VCS1xzvXFQdMLKz9gMAA0W1yZoPncOUpIzHEv1pPrjvd6Yt2v4jOIRufdgYTh0eavz9ftF6LLox6G8F9P72+aKdKBqI9tLpz+KozQ0EtaKlhwqNQtb51tGTnEUE1QijoGd1UGxi089Eu+jCnyVeJhA2n8eH7i99K6Nn5yVEAt46PecMsbr/tAEkdxpi7YVZww+TC2hdAjJ9ZF8woyNdJEfiMe9/Pg371AabiMp0pvlNk/gQefUU2Jf8hHhZQIS9ONxeS3bzkrSvOfroCXPn7qVblQ016ZRvdN6YKCwt8clI+Zabi51cclIEpAMSmhriOMTyTflnOVYK3QVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(376002)(39860400002)(346002)(8676002)(66946007)(66556008)(4326008)(4744005)(186003)(66476007)(2616005)(36756003)(8936002)(31686004)(5660300002)(2906002)(478600001)(6486002)(53546011)(316002)(6512007)(41300700001)(6916009)(26005)(31696002)(86362001)(6506007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFlUa0VqcGxQOHZmT09mcUtxbjl1bW1uVXpWUVZ6aWNFbmVTUWdneGZ5a0kx?=
 =?utf-8?B?SkR0VjFsbDlNMVB2SHBhQVFheElpa1JWRjNGM09zQUtFUTEweG9QVTI0Uy9G?=
 =?utf-8?B?MW9rSFZNdkdiZ0UzejB3WXBNWFAxNE5Kb0p1elhnUzR4ZzNjT0k5THJtL1p2?=
 =?utf-8?B?UjhiYk5yLzliWEtLaytsOVlWbWw1cXFiNU1YaVdJa0w3NkxBNXhTakRBZU1N?=
 =?utf-8?B?S3dyaUlpYjcyYkUwYWNDQWhqRHoydjhmZjRjRGZDdU5xTzZrVm1CQ0g3N3RS?=
 =?utf-8?B?TnJpM2xoSnhFYW0vQWdGRUwwZC9XNFR2YXJ0YXFWQ3RucW9leWVJWnpNa0tD?=
 =?utf-8?B?Y1NLZUNBODlHRVlYN2g4ZThkZThFWk01MlY2T09SRW5qYXVpSFNydHdBTmt3?=
 =?utf-8?B?N3lwUnZ3MTJpYWhQajVLVVNaSGd1TE1nd2lYMDdWTDhjWEhzUnJOTk13MFl6?=
 =?utf-8?B?bkFTVkh1TFY4SGh1UFFFUTFYZUQ0d3J1NGtIZFEyTlk0OUNqcWZGT1JLY3hk?=
 =?utf-8?B?RitVNVlxZCtzTWNNRnZPK1lidmFRc3BFdjlPZW5pbXVXdGU1cjUwQmJNam9n?=
 =?utf-8?B?SWtFalNIc2gwak11cGh6cmNsU2wvdUY0ajdCWmxDclhZSmwyTXBXdC9RZ0x2?=
 =?utf-8?B?L1E0SFM0bmNhT2U0VE5QTjhWc0o5WlhldHhiWUhONEVGcS9Id2Z0dFgvejZY?=
 =?utf-8?B?VmF6bHdtTkZJZmd5ZTBoNlMxQ2NYaUtTcU52OGljWEZwYXkwQ2I5TGU1S3Jt?=
 =?utf-8?B?Y2RTdWMzdHBzM3BsSDRta3NkdFA0ZHk1NUZ2aGppbXdFS0xBdGM0cmw4SWln?=
 =?utf-8?B?eVlEeXlmV1dHeVlLQkVmOEtWMWVtWUt1dVNVSDBlV2ptTG1vYWhoU1NPbGtK?=
 =?utf-8?B?bFNOazJwUUMrbGtzMmZ0di85dVhUNFgrMk4rZFN2cVRIOGF0dkZSakVjVW5m?=
 =?utf-8?B?M2xEbW9OYWpabWNGSnZURnlpNUdKZGVxRjhyVkFZbDljVjAvU004NlVhajlB?=
 =?utf-8?B?ODNFT0VMalVOd1R5ZmEyRGZ5UHJVN2hQUjhhdnp4NHdyMjdhSHo3bCtUcy9t?=
 =?utf-8?B?dm1tb3hpQ1ExRHZZT1pyNXRucFVnRjVPUTZkcGswdVU3b3IzUjJualc3UTgy?=
 =?utf-8?B?S3pOZ3BGaEpqcmRuY20wRkV0cDZ4UVZERDRheU9NeXhlVU15Q1pZdm5EYXZS?=
 =?utf-8?B?OU1qbE14MDNWV2EwWUlGZlF4NXhlcmtWTkxxSkhKeVhJT0Z5SXRnRTBVUTlD?=
 =?utf-8?B?YkJzclhvbG1IbDBkbWp4OFZSVzVKc2d6TUx0QXpJUGdGRUNWM09VMDhUdGRF?=
 =?utf-8?B?YXZESUJPZFFYQlI1cDlZSnNJWTgrL0twRGYxdWJUOFRYZm9iWEI1bmd4ZXpD?=
 =?utf-8?B?UUJHUjBIMGlHWmt2MFBpbmpvYVdwWmtSTUdwVTVRTFNXMVh2RmJFeEVTbFBp?=
 =?utf-8?B?UDViM1NFOHp2VWQ3WnQzdHlseDRrWldWWGF4bGhnNGk3YkhTNXQ2bHZmT1dD?=
 =?utf-8?B?SVRMMTRZV3Q3Sk1GZTlqcUQ3aENueEJnZFUvYmJQd2toV2hHMWdiZ2U2VFht?=
 =?utf-8?B?R1MxOHptQi9JNnlPa04vZTAyTWN6SkpxOTAyQ3UvNk5HR1AzaU5RWjQrMlNS?=
 =?utf-8?B?WEMzMmxDaWk3K0VCOXg3R2NUV0d3SENtUXFKSXA4RzhHMlJCb0RraGdwWmUr?=
 =?utf-8?B?TVYvU3JVWkF0VTRYNDdpMmpFSXN5V0dBRnAwVU5RZURHaXVxSWNTSjU2bWFF?=
 =?utf-8?B?UUxyaVB5M3REaHgrREtuNGIzdEg3RTByL0tnbzdCaEdyYlI4OU5JL1JHVEdV?=
 =?utf-8?B?LzJ5ZnR2TUQ2ZWE1VFM5bFZ4Sm9TYyt1MFNHdVBuRGtOKzlTbmhSN2w0QS9G?=
 =?utf-8?B?U2R1NEw5eVdoYTVYdzVzczA3VUlRVW9ibEdDRnRrTWNHN2kvS0J4Zyt0Q3d4?=
 =?utf-8?B?MzlFNG9uekNmMTNWK0hlY1hPdElTQ3lpQlhkZVg3ME4yVDk0Q2xYK01kK2w1?=
 =?utf-8?B?TXN6a1NxR0FzODJyaDJYWXNWKzZ6aWZkNVlaZy9iRmRWLzlweDFLOXpSYnBq?=
 =?utf-8?B?TVlIOTZZbC8zZWpKcmFtT0krcEV3S0JQalN2dnE4eUYwVWwrTUNtblBHYXJG?=
 =?utf-8?Q?+G6bTEuVzXR2w6Xm8NDbMbhCb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe615f9-af13-45ca-65a8-08da752d0b7b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:49:15.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBGSZ2BZh5feT478lOO8zxoHmMLSGVjvlDFO+Tw7UvCZfm85gTH0/j43L+WIk6Q0ZimA59YzVCLw+wsckWB31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2905

On 03.08.2022 10:44, Bruno wrote:
> Jan, I am glad we see this now!
> 
> Should I report this on the to the linux  kernel dev group?

While you might, I'm not sure they would care. Work needs to be done in
the hypervisor first, with Linux making use of the added functionality
(i.e. presumably a new hypercall sub-function) only afterwards.

Jan

