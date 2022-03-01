Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00D4C8CDE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281475.479824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2mz-0006Cw-Qv; Tue, 01 Mar 2022 13:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281475.479824; Tue, 01 Mar 2022 13:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2mz-0006A4-Mq; Tue, 01 Mar 2022 13:43:41 +0000
Received: by outflank-mailman (input) for mailman id 281475;
 Tue, 01 Mar 2022 13:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfhu=TM=citrix.com=prvs=052ba2b28=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nP2my-00069y-Cj
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:43:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98772716-9965-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:43:38 +0100 (CET)
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
X-Inumbo-ID: 98772716-9965-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646142218;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9JZVEUfUgVGCzGZwPMO7/BrprmBcSVATClbrT3NVFJQ=;
  b=PE6A/Tu/rOH4bkqj+fd9l1cU9d8UL2PCwG9Jfa5sSIgwXFlztsn3sXNn
   iNcRggFmi5cPfJ30Tn6ou2AsQuorTeLr7Ok1PQNzElHGUrZB2beZE+nc+
   FCtFhaZbk8uPGrwkx61dDrOK6cwTXxJ+LwMERXbiOCj72OVdT9HcDPlVt
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64659634
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/ofwJquaWf1FVU/KPHcCJuu69OfnVEBeMUV32f8akzHdYApBsoF/q
 tZmKT3UPqyJNDSmfdx3O4W0phhX7JXWzINgSgA+pCsxFXsa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi81GqDhodo9XyUBNCEhF/RlpIL3LCKW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 5REOGQ0MHwsZTVoH0dJLLUYgNyNmyGhWBB0+GqzmvAetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO/Ee5Sy09IrY31++BjcuFx0dVewr7uZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZD2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJ5bImG1O
 RaK6Gu9AaO/2lPwNsebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqd9DdQ1RdCNjbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:jMbR/KrAUsyYLpu2z99fdxwaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="64659634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5vCUTK4EWu/UnquWQ3DFsn9FxKdTINpw/NZVoYMQQY4ueUXWCkSzJBBgt4noj6Wcxfu86v3oRY0LI+oRBEZn3qH+6u3P8fwYvPLe8Xczz4pbNDlvKGrW2DDPP5ipJUB6cpcew8xCMqGxksBT16OhMtt3nUmF7H0WFV2YlQTc1aBtWqKphdVkKupnPegr1wbRlFtIboAZ7hox1fHgyf3sAag4CSmGrVRZgDaoezWAXCNKMvt7GxMWnO2op6a+IF5RsnB2RKOxY+spO1utSzsfC46MQFESglCL42oo+XxSDQBGOuxpYYrCU5igWrONoE6b9RIKi0hrnUXhKTGhG9Icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+SBL3Rf+ExGdrUo3Mmdpp8ZIwRGZZZeo7loAC7KyZI=;
 b=N9mueqtH94q+6VxnO44tWR1m/UVTE6lJsbv99Eog8RjS6NiKJajBwnHs65CEOYdQjsfnpq4qi3mduSruRJhVxuEfTxXcKrZu91Bh3OQ5l1AIgTNRigqpBfLoFh1EEEM006FPfYGthuMKnTYXS1ztEYhZsaXxHKLMGlFwmR0c7ZdPPzjJwoHHMWnbJORWLm6NQX0uHm5f1INsDYYH7DwOPAXYf8kop4J/+NjAKddlhbbyGvtqDdqODOR3OJwwefSEz8+CoygsGhf+L5X/79ileuJBYcEgWeWM8zplFQH7CNQOCVtXN//LOu7tI9EezVNOcJq6HCe51aRs27suqgseMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+SBL3Rf+ExGdrUo3Mmdpp8ZIwRGZZZeo7loAC7KyZI=;
 b=Pn8bIl1j0R2dHJxK1QprR7646m1T/HwL8RSM8ldKlUVOjU3gsT9FpTk9cyWv4qNBmslcEnRFSaWVngxZTYAquEArEMetXJrQNsdaLBe7hB0OxCX5Nz6KGibwAtDynyo+pHmp9W784X5ZII0m26ItFLnLcUkya9j7Q+gU2Fq295g=
Date: Tue, 1 Mar 2022 14:43:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: fold sections in final binaries
Message-ID: <Yh4i/QPAggI3AVpC@Air-de-Roger>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
X-ClientProxiedBy: LO4P123CA0353.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02ff37b5-fa28-4d2a-eba6-08d9fb897967
X-MS-TrafficTypeDiagnostic: CO3PR03MB6759:EE_
X-Microsoft-Antispam-PRVS: <CO3PR03MB67596DEEB513D5719104DFB48F029@CO3PR03MB6759.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lmaNazFV2ayhWd5/yWCljC5+BCswBgzWzYMjLUyyAYklrPeskIJ9NBrq4K+HgDY7tzxDyFx29IzOrUZCmmSBUhKOkKecxVcyDlCJuxzmtl/5D05cyronOdepgzBEYlmRGduE4iCdJChSgvKM8NS7cPhtpfxvosgiH7o9NKDNABguKPBI5rBw9c9QUIn63Jyl6IRqqbnBFx3QO0dt5zUD4mN+uWlN4+3DtaMrPgtuU/hw9sthww3eiS1Z9YP0SSr1YLUZve14MeJfK6ixGtMFO8pJ0rbeB8WMcK8MxAnMektjyQlneqja5cqY7rgTs/QPl7AZlSX42nCJlx5S73DXY5BfEUU0eAb3s4ZEDS+w7ZwdG0ondo9gNqGDSgxKYAsJXGeaF/otZqiWidmTrFuVlI0SlDeni8Wdlr5AVaxuRZIUr+UNSu3CAPbOinmMUihuZj9Dfk9UDysv6koLYVKCY74RtIPvplTbhAsPPLKLDeUk2pNLY3oB3B9wkR4l+5qYOkVwp199WtqeQwAuzWWTZf5boGEEiWv4s5f5uJ3ZwgV+U2JCQYjiFFKQWZO5RWs+XKlT5yl45zIZ3giY9F4g0AoG/lKZeC2Ct4WoaZ+h1ckQ6GqaljB0ppq5pWZ+sroSJYzqi7B6PU4QPDjL3/1oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(86362001)(66946007)(4326008)(85182001)(26005)(186003)(82960400001)(5660300002)(8676002)(66476007)(66556008)(8936002)(38100700002)(83380400001)(316002)(6916009)(54906003)(508600001)(6512007)(9686003)(2906002)(6506007)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJub3RNb2dJclhna3gwblRyNGN0Y3hURi85aW5zbEw2TzN4S3puRDMyWWpP?=
 =?utf-8?B?cGtBY1FQR0V1NVlOZkdpMzM2czV3WVRxaHlmUk00aER1c1VyV3JBdktpbXJF?=
 =?utf-8?B?ZElaVE5qRzhjcENva2R6bTY2UStBTDZaZERQcGNyR0RJSXlka0FycVozOG9a?=
 =?utf-8?B?SDZ5ZkI1S1E0d1NGaWNSenNDM05ULzBKWFlSd2NPUG1JbTlHZi93VHBUSi9l?=
 =?utf-8?B?ZVB1cElDZVY2NExKeStRbTRNTmc5L0hZKzVXTzA2Y3ZRR1RaYmtsd3l3S1Bl?=
 =?utf-8?B?b09XdXhRcEw3cHZqT3NFd2E2YXhrVThHc1FBazUzSjF3Q09CYzZqVU5EczBi?=
 =?utf-8?B?eWRGZkpPbGFCYlBWVitTT1QzTDIvdk5jSDFBWWo5SyswSGI0T2RiK2NjTVE0?=
 =?utf-8?B?SUNSUHR4UUVWRCs3dUxyZ0RLSnlScWEyMFcxRUd4RHd2dE05eFU5T3dXazFJ?=
 =?utf-8?B?MEo2NlBUbXd5Y3N1aHhBRXVSRzU5dkxJWDJhYXNWUCttRXVnU2RvVEpIVWF2?=
 =?utf-8?B?TlBlZ2Y2RHJQT3lPVkxhbk9rdXJHN1lwYWRLYkJ0ekIrOVhJM2FTejByaU5X?=
 =?utf-8?B?SWF1QlNOemFwdHJpQ0xxc0o2VzZydFdFcUdEazJqSWo0R285MWxub0dsZjZB?=
 =?utf-8?B?ZUo5QTV1UGliOTVSK2VMd0VwZ09VQ2JGZ0dpWWs4cmM0SnMya3NKTWpTMW1U?=
 =?utf-8?B?MkpldG5jNGRya1FQUUF5NlREOWtGMXhBdHJSQmJqa1V6OE95Ull2Z3hwNWxk?=
 =?utf-8?B?RGtBUUJaMlN5U2pYQ0JWMG9vNDNVVUlyWlVIRXV6V1RoYjM0VEVPUnAzV2Jy?=
 =?utf-8?B?WmJjRGhKNW5EOVNjamRtWUFLa3d3SFNZWlVYbndGeDBLR0R1TnJ1Rk1WYU5K?=
 =?utf-8?B?YnBPeU82eFlqdWE0ekx0UDgyQkd5Qi83bkFGWVZqQ3FmOG16L3NkSnJrakZo?=
 =?utf-8?B?T0xMUzI3Nnd5U1hTei9nZGtkK1puejVxVjZ3U3lqVjNMQVUvUzhxelN4QUx0?=
 =?utf-8?B?cWpVT0VEbWpLSjhVVjVFTUNEUFRZZGhWdUt2amJCQ0djZkhNZm5KWkx4UjBZ?=
 =?utf-8?B?OG9DalFqa0F4V0VpZ2toMUdLaTZRVmhaUCtaM3AySXhEYk15QTRwa1cyTTBj?=
 =?utf-8?B?aVhVb3I0SUlGRjV3TEpSZlREU1YzeDYwbUc3cUNLTVE4VDZqRlFnKzRqZzF2?=
 =?utf-8?B?VHN2RXp4aGdoaUw5emtIT3lTQm9QdjJLTERDMVdTb0RzK1ZCVUJtZ0FDWmZB?=
 =?utf-8?B?TjRCV3c0eEtlQzdZT1NZODQyTW1zc1dkMnZRWWNicWozemhlNU5WN1Y2dStr?=
 =?utf-8?B?ZG9ESTcxbjZMNlZud3FQcCtzaCtHbFBoeStZbXVGZVo0YVZMdEh5Vzl2NFVl?=
 =?utf-8?B?RjU1dmZFMmVYL09WLzc5bzJUQjh4YkRleXhWUktxNVdHY2h4OWhONjZXaWNy?=
 =?utf-8?B?S1Q5NjMrcHdFREZMQ0ZJUXA3Vld4VzMxQVF5dHA5ZkhlVnFCK2JRcURSYVhP?=
 =?utf-8?B?MXpIWHF1SmlNc1gxd1dWTERYd3JMM0NSN0I5RzRZYnE2Q2hCRTZKek1Gekx5?=
 =?utf-8?B?N1krOTlDUVBUMlZrckJvL3RJT0gxcjZXYlhPZDNkcDdYdXMvYkRxQlZ4eTZ0?=
 =?utf-8?B?Si9yck8rd0NPM0ROSlp3ZXQ5QWF2SnB6anVabDZnejVDRGIwU1ZsWWJkR09p?=
 =?utf-8?B?WVJCemtBcjZGRnhJWVRVcTZoN0tCajFJT1haa1IxTm5RYjhBNHc0NXY3Y01T?=
 =?utf-8?B?bXVjczlKZ1h2MDZvYmlZZ09UcklWc2NaYlo0dWZMSGtMd0hNbzJFYThpV3No?=
 =?utf-8?B?NjZDMC91bDA5RlR5Zkg4YStpc2lqTUJiK1NTeGlVWTFQVitmK2xsV2R5TmVh?=
 =?utf-8?B?T3gzZWx1SkJMMm5NcUxPUVRzQlA1a3JnSVBjODlwaGcxRWRGUEVtVG5qOU0r?=
 =?utf-8?B?WmpUL044T0s2L1hlbXNvM25OeUIvUGhPd08ycjZTL1p5NlJCWk1EZVRnYnlM?=
 =?utf-8?B?OUh4NnNzSjhJL0lFT3VnVmY0Uk5sK1poeEE3NUlIR09hNm9TdElwYVZKdXlI?=
 =?utf-8?B?aFFzWmg0by90VnRtWld5bTU3SmQyR3FscGZqU3JXTUQrZFpLMktNbThxVjNM?=
 =?utf-8?B?VkpxMWJHaUpHNGorbUM5TXF5ZHN3dUhIc2t4Q0FjSkhCMHlIWk43S2U3M3VJ?=
 =?utf-8?Q?YcgpffDAZVpuU9ZNn0lGD1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ff37b5-fa28-4d2a-eba6-08d9fb897967
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:43:31.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xs6VNexOsjE+HJKGnDKBukALbdY8JtfcWpeIH2B219IExjRPedXMdrEGIBGXMnVrHk6sZG7e4/6ldSnekxNRKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6759
X-OriginatorOrg: citrix.com

On Tue, Mar 01, 2022 at 09:55:32AM +0100, Jan Beulich wrote:
> Especially when linking a PE binary (xen.efi), standalone output
> sections are expensive: Often the linker will align the subsequent one
> on the section alignment boundary (2Mb) when the linker script doesn't
> otherwise place it. (I haven't been able to derive from observed
> behavior under what conditions it would not do so.)
> 
> With gcov enabled (and with gcc11) I'm observing enough sections that,
> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
> failing the final ASSERT() in the linker script. (That assertion is
> slated to go away, but that's a separate change.)
> 
> Any destructor related sections can be discarded, as we never "exit"
> the hypervisor. This includes .text.exit, which is referenced from
> .dtors.*. Constructor related sections need to all be taken care of, not
> just those with historically used names: .ctors.* and .text.startup is
> what gcc11 populates. While there re-arrange ordering / sorting to match
> that used by the linker provided scripts.
> 
> Finally, for xen.efi only, also discard .note.gnu.*. These are
> meaningless in a PE binary. Quite likely, while not meaningless there,
> the section is also of no use in ELF, but keep it there for now.

Should we also use --orphan-handling=warn as to recognize orphaned
sections and attempt place them? We have now detected this because of
the 16Mb limit, but if we remove that check that we could end up
carrying a non-trivial amount of 2Mb aligned unhandled regions.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>      ld is quite clear that this is an a.out-only construct.

I've found some (old) documentation where it does also mention ECOFF
and XCOFF apart from a.out:

"When linking object file formats which do not support arbitrary
sections, such as ECOFF and XCOFF, the linker will automatically
recognize C++ global constructors and destructors by name. For these
object file formats, the CONSTRUCTORS command tells the linker where
this information should be placed."

I guess we can get rid of it.

The patch LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

With the possible addition of --orphan-handling=warn.

Thanks, Roger.

