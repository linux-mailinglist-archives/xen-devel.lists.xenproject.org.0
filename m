Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066B6ADDC5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507324.780682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVif-0006bw-0i; Tue, 07 Mar 2023 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507324.780682; Tue, 07 Mar 2023 11:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVie-0006Ze-TC; Tue, 07 Mar 2023 11:43:00 +0000
Received: by outflank-mailman (input) for mailman id 507324;
 Tue, 07 Mar 2023 11:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZVid-0006ZY-DZ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 11:42:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f482ec-bcdd-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 12:42:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 11:42:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 11:42:27 +0000
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
X-Inumbo-ID: 33f482ec-bcdd-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4MxEEzWTBh0+0gc3Sw2BincNv4LBYx5FWjVQtpUjCutpmsaOE9qDC6ijieGJFsyrfaCzFBbLOT0VZQSqAyCm54GzIMolXerp2iAURMDu1plzHWHIY/DKu2LqblQU9tfqJOI9YShpGlyPuvGp7IA/xizpw07sXn52j9WQXtNduVlNTnWhcVHqkJTSH70nLDSHudxSLkSE7LBsZ+N8al6eDbzerONO1Y9W44sCiGltavSiQsrYKj3Sla1ESsu/qDHIjYVWZ5BApr+x0Ao5eSaZUwsfciUPiqhd7FteZEgndGHZW7KU12khdZCqfgvJf+26kMLeKCqnFaGI2LvXIWgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IY4T1oa816d9IcwP86x/Vkig01OAVMZZePzJeiLgqI=;
 b=jCOlSWMDdcAxehBcC/Tv5zhSEcssfmBMn9VO1ia2sReQ4uusHyECuxHlnKQmhmIBQmJPJpgtJyrKWuN9roTo6ulqEYvW9WqI2ZYPwHYu5Uk4a6UgTGhOLhoqJO2+1E3ZOT/7SNZoEJoMjC5hPk0mbxAgQyq/TOAv1r1sZnQFfqGxVpWJDTVlEirShGL+D41T7AU9E48pKXsu5RUi69eSpJZXW1hwIhAgTx4j5lVDp62ZhTRCO2OTfgxoUvTETE10dd4O+34jdaYgcbwjBQgSezcXbn8qiyKAn1ARHA5O2hIx/63xMWtRtItuSfYwutfZW6MVs68tW4wtv0pMBzsDlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IY4T1oa816d9IcwP86x/Vkig01OAVMZZePzJeiLgqI=;
 b=RzIffzPCWjoWMy8vt+2c0f1WTP5wja87Ko/O60QOsIUGnEmNp24ldoD4CqcPPkd40kcTOdMoKHLbn0ojMUGzd9zng2OGqrXpExW6K2AWI0fbEAnIGCIpE8CN7bPC1qqHmrky/Aitfsf1UCJZgukUTjrOmUfI6YQfNbBYkeG/YHOaLyfmKjrzZJhjJru9DCVKmLQ9UvpykMSBIK+HIoqNI6dyW1kzSB9rJQ6MdJUNOhCKbgViezFwdIEB2pnVgslm4vsWwgla/zpmCxqaDzLFa3mHnFiL91APF1Gfy7HxKo/xAZkXQtaovZ21OSpLwTeAUdpysAtFHGv+TAWuVwM8gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40fa3767-cc11-aba9-15bc-e528965b599a@suse.com>
Date: Tue, 7 Mar 2023 12:42:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] xen: move CONFIG_DEBUG_INFO out of EXPERT section
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230307063214.30569-1-jgross@suse.com>
 <20230307063214.30569-2-jgross@suse.com>
 <e1353c0c-9501-3713-b759-0989447e6496@suse.com>
 <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d3d2b65c-ccb4-5408-38d2-d637e1f67064@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b4734e-83cc-4015-f50f-08db1f01065b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iTgYsJ9g2DUqzM+8PpwFrNLoypVptJ3WUkOmfrInATP/FXdQNfAhskBfs/oZuYw7A3WFV48/zVL11rxEtWu41H+ooM+6BROTFmpjaBjRiCxuAVidjZIW879gss1UUsYzhLKqYQ0Pa5obvUVfyOIPjo57uA8vq6cnDXP9KGk7RnKhsFWROyblTJmyVdA/AUV4vj7y8TRT9yvT+FIAMGFQxMci/6ODeaJbBMUgYuRJpPtllcii/81sjTxbq1QRp+aPhmaB6GceUvGp3mQZxsgTAOqSEfBTyxNuGwfqD5kKv9p6Tdt0BHJNsyle4emXyEOwsbDh70TlQwWBXy154giQAa17pPqYk1CO5ai056f13tb7kd20WdS4UKxoNCJ2diTQU4Z/YfqcKQQBU6d5PhMQqIEJR+1/KfhZLWfeF5uSe/XLE1rtukAigp39a+5jb4ETKjRD5r50LjPShPFl+UAOmtfuwKyZZUOTTtx0QxjWm0VyWAqQVyw0txmnaG5eMGX4aIS7X2WgdY7p2StlDmWfaEM1NdIh6QesS9fjZ/gQfOaep1ckMVoyk0HoFfv+yrUW8A0YLBbAgmuiePUjcckAXa0f75+km/fS91GOQbA2kiwojbll5AaXE2zkURscswFcBCt1Sch8lzEWjV3cuDbSy8LOdt8fsBu05rwyhmM6Iln1mVqhnbBKm9WNgbLNvABciYk7E5w2LJxBvBhaGXemhMAQ1xnhaUhug/MuM536WdI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199018)(31696002)(38100700002)(86362001)(66476007)(36756003)(8676002)(5660300002)(6506007)(6666004)(2906002)(4326008)(8936002)(41300700001)(6862004)(66946007)(66556008)(186003)(2616005)(53546011)(83380400001)(316002)(478600001)(37006003)(6512007)(6636002)(26005)(6486002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGRLUGZPbEtqbXVGS0N4Um5mdWxJTHBMeG9xbFRUdlNWV3RqelBMV1QzUk03?=
 =?utf-8?B?cHJGQmQ2RGhlNFV5aDJnVUJ1NFpiTjZrNDltcVBZM2pPNzUwcDh5eGVYMEda?=
 =?utf-8?B?Vmx6Y2xQVGRLanFWOGJtRDc0amdROW5Yd0QzakJmNUlsSVc1Vlg2eWRvYUxQ?=
 =?utf-8?B?OTlWZ0ZqbUh5T1VHUERxbTNkN1RZSERCSllXUTFGMmlpNHFDVTcrRmRFaDJC?=
 =?utf-8?B?RHhkbnhUMHBDMzJqVWp4cWgxeFJvWVBTOHI1aTBaU3RCWWdoZjdkZnFLaTJZ?=
 =?utf-8?B?ZWhTTUVsYkZXeDIra0d3ZkdXSWQ3UE9qUWZxaUhkUnNJd29vdkFEaXJmd1gx?=
 =?utf-8?B?TUpmU2FRRGw0VTZsTnNQb0NTL1ZMdWFxVzJnRlRzMFA1Y2l5S2x1NW85YzJt?=
 =?utf-8?B?Q2wxRWxybk1HUXVWSFRhUG9VU3A1cTBjUlJiZ1Z3dStxMnF6UWpPZFpkbTZ0?=
 =?utf-8?B?TjhMNlg4V1NSYUlYdXJCSHd1S0lCQ3lRTUdnOXRqeENZMTdoaG9XRnlHS1dw?=
 =?utf-8?B?eUNyb1ZJSUJJbW5WSUlpZWxZMmo0SFZDbVJjb1VlMm9JOGhTaTZ0ZTdYNkdr?=
 =?utf-8?B?dmFSTGNRUG9DbTlUK2o2YjRVbk1vN3grR1RxZkVGTGhMd2R1SVBENzZObzZ4?=
 =?utf-8?B?RnJVYWFGZEU0NE0wRmRsM0JiWDhFR3NEV2UxQ25jRkt6YmhIVUpvMHBQakFM?=
 =?utf-8?B?clNHL3daT21ad1crNjNzVm9MOENuZzQ3VjRmZDlTaWI5N1BEVnJqRHpkaXNo?=
 =?utf-8?B?cXpwZGJna2RjZWdmc2dNTC9sQnRlTU5qN25jQXZDQWxHWWE1cC8vT1ZUMytu?=
 =?utf-8?B?SXNYanUyOVA2ZFFiaUhKZFhubytuQ2RBbE9hckxTSEcvcGYzSW1JVVFtZ1Zy?=
 =?utf-8?B?blJ3TEY5T2hXSGVBWFFnclVQSHdiUFk5L2s3ZnpwQy9zakw4SDNHY0t2cFNw?=
 =?utf-8?B?b2ZsL3k0UlpwRE9FNjl4Z05mNWxGQjhqdi9QQzBDRUc1Y1FWSFdaTlFqM3Q3?=
 =?utf-8?B?SG1rUWtlZkNkVm1GSW0xZ2FWaEZRTnpSSU5HM2VHaEFoZ2ZKYnZLT1U5YjF1?=
 =?utf-8?B?TXpxeDZLVXNVbll1MzBMV3puS0Y1bk1adVR3SXU0aWp2VWdmbjdzZ0paMHdm?=
 =?utf-8?B?K01FWWNEODVSaUh2N1N6UURKRlUwV29lSDVkZ2FiZ1ZPTXU0bS8vUnkxN0Vj?=
 =?utf-8?B?QUlBUkNEZ1pvSVhkR3R3K0RSNG5MVTE2NzVNbFNYSE1Tc0pRbGx1Z1BXVWRy?=
 =?utf-8?B?QlcwY01CU2l6SGFxUDlQc0syc0dJVU9zb0xKV00zY2VXYTE0SXFDanVSS0d0?=
 =?utf-8?B?TDBtUlJuVm9yNlZYSnlwcDVkRlovbjg1UmoyOElOcnBLQnN1M0RxNkE2SWNu?=
 =?utf-8?B?cTRYdUN1ZXE0VVlUVzBidk1LeG5jUXc5RG1EOC9JekNUTmx2V0VOTVJnQnhL?=
 =?utf-8?B?VjYzUzdiYmpOazRNeFlHSmRMb21aQXRML1lJU1VmcFZSbXAzOU9SU1dha2lh?=
 =?utf-8?B?TlRqU3NJNnNsa3JHbmNoUjI3aTBoUUN1Z3BpWmRvMWQwRVNsSVF2Q1hENlF4?=
 =?utf-8?B?NW9MSDIrQ3NJelpac1hYZ0ErODhIZFlpOEFleGF4UXFzQU10RWRuU2wxblpY?=
 =?utf-8?B?UXlITWtrWEkzLzBjbTcxY1NpVWIxcXpMK2ZFVzRYb3FFVkFJVEYvL3pGeWFv?=
 =?utf-8?B?SXVjMjd1bkhrYnUrM1VLR0tiWERBUEtZNzBOVlhSTGwrMHQvS0lRbWV1NXBr?=
 =?utf-8?B?YndxMVVMQWNZNjhrd3AzR1YycU82S0thd1dNZ2tuTHVZSGs0MW9rTXRaZHZ4?=
 =?utf-8?B?U2pDR3RxVTcwT3BadVduaXlaYWJCZ3EyWmIxNVFHaGo2N3BPUTA1b0t5V2JQ?=
 =?utf-8?B?V1h2VXB0RjRYVm55cHZjYnVpOGRoVVFWL1IvVE5XTlVxT0NLMVRmU3JTSlNh?=
 =?utf-8?B?MTZXbU5peXFjSW50STRObFFkaGxsbS9rdEJtbWljckR2bWpFb0xGcjlRbmkv?=
 =?utf-8?B?S0tmWTJtU1pzUUZ0QTcxSVpnN3pVY2ZFM09vclBFSjA5QUhmMnlwSzRmL1or?=
 =?utf-8?B?SmRVcFBzQjVUMjROcEU3Y2Q2WlU2dGtjZ3hXZFdJd0RyemluTUs2NlNySFcx?=
 =?utf-8?Q?LnLBFsC0aRKX4JIB1hFZRiHhx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b4734e-83cc-4015-f50f-08db1f01065b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 11:42:26.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enJFXwi27h2t8aQNBbGBRQQumoEAgXOyG8c23t9tiHWwMqi/C79OjCr6JgYGg21JPpoX60GkiENwdu1+d+ULeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343

On 07.03.2023 12:33, Juergen Gross wrote:
> On 07.03.23 11:31, Jan Beulich wrote:
>> On 07.03.2023 07:32, Juergen Gross wrote:
>>> Using a rather oldish gcc (7.5) it was verified that code generation
>>> doesn't really differ between CONFIG_DEBUG_INFO on or off without
>>> CONFIG_DEBUG being set (only observed differences were slightly
>>> different symbol addresses, verified via "objdump -d"). The old gcc
>>> version selection was based on the assumption, that newer gcc won't
>>> regress in this regard.
>>
>> This is good to know, but I'm still curious about the mentioned
>> differences in symbol addresses: If code generation didn't change, what
>> caused addresses to differ? Is that merely because individual functions
>> or objects are emitted in different order by the compiler? (If so I'd
>> be inclined to infer that comparing generated code must have been
>> quite a bit of effort, as first of all you would have had to undo that
>> re-ordering.)
> 
> I did a simple diff of the two disassembly outputs and got only small
> differences for %rip relative addresses (the differences were in the
> range of +/- 32 bytes).

That's still odd and hence imo wants understanding. Do you still have
both binaries around?

Jan

