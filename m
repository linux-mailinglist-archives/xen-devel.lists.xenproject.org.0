Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F12E9C11
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61436.108122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTjm-0003Yw-0d; Mon, 04 Jan 2021 17:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61436.108122; Mon, 04 Jan 2021 17:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTjl-0003YX-Ta; Mon, 04 Jan 2021 17:33:45 +0000
Received: by outflank-mailman (input) for mailman id 61436;
 Mon, 04 Jan 2021 17:33:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwTjj-0003YQ-Us
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:33:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7bb8a1-6020-41bc-93ad-df5a39a57afb;
 Mon, 04 Jan 2021 17:33:42 +0000 (UTC)
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
X-Inumbo-ID: 3e7bb8a1-6020-41bc-93ad-df5a39a57afb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609781622;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dkCEH15hgt0+2Fefsz2gURAatM71fgCDRHUmaichmYo=;
  b=dIKoGjNn9I2hrS2MH55c7Of2Q/+gz+J9DK0yj2kMuQSyDc8b/5/8Rkf4
   NiHjgrslnX55/39Sbxt0QiJHtAph5QIHgcljS9q6yPSGdku8SGPT+Up8k
   g7mBiuz3Qsv9cLU9vzRcGSxWXxOumG7swFhWQzIno4i7B9etPUErdGLvz
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7lawoXKQzD8JgWo5ViCY2r+PbY9jYuvOJSpTBTmx9htVRY141iivN2XRcbFBW7TVfO/LLQiSAs
 nvARSE1dQTmKTWbUzhf2t4x8H5TqWHppX9LGq6wui+NkJA7amxwjfY19Re+nEv2qjNEVonbI33
 wQHfKyRekpqpVhJCkYgHNZFvwQxn3bty/c7OWOnB5D+5ndAICEmlu9NhXWNoztfRv2U+xxJyaz
 4IYakppk0Q73Aibw+bPOM5rm0Ni6oUhBpoHsem9Y7Hk0xRs0ubNaRkPQoMgDGSPgw/vlgwF5At
 C5g=
X-SBRS: 5.2
X-MesageID: 34723003
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34723003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUMg5Ep0lbDD6u8dX1VmLq8rLZq1AMMS492EFIYzspnMBI3huTypDimBQ/1XVigLNn3AOResgjoMf/JrGa4kuoZgmK4EHZ46lF6Jh9V0eFXu0n48GC3LiUuv6D8ctBegdkglVnnk9G3UDjkqodn9jS849vgOTQWSuXlv9YLO5AACvAElNJ3jB3WTuJ8KPZNDvCo9zgT4x1Lf69zWx0WrpRs9wcf2JcodNc2oV8kPk6iB/DnZ95iqvzqhxnj2n94P0B9ohTJQ4aMmw3tW023ErSch2yBxIGQOWjJtvVWF3nB3cNnbGIBp0ZI3tPuvTtQ2PAQPsGTXbRUf8WXwbexkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rau/qVNuqHf+E87QDYPfetCIub198Ef1Rc1cA0u1rTM=;
 b=EcF/VrGU/a9QCPJz+H1C5Eqgz3XaJwjAifdbUf4zjMJrgIGSa2G5pTfz4j6uj+BDerE1tYGOm+RJwM2PI+R+paDh+R9wpNr9mQ1wUY9M0orSFkO0foqCFLUH70M1d2S09c6GYd7ekYbn4eGpUqa5Pg/m5SW1+k2fj81aaa0uarvbM4lzS6nhvVvW5aMPexurUV3K1mf5YZR1BrQ1hqiXSAqBv+iGZNxlLH6BAEfmeeBYvAHPMn9Y5EdRebtQnBLJlg4IahPJnxNrVZioBTJcrs1IfHCYUuZa4UxbtuC5h4xWlKDng9IlkmSTnuqFnRS4BGwfJ6Y9J4L1MxAf9y2cWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rau/qVNuqHf+E87QDYPfetCIub198Ef1Rc1cA0u1rTM=;
 b=pEE76lBpgPECwfgx9mL5niP97liKye6J5dqUqmZZkC3wRbGgNSAnXvHY795fqCCC9Xg5YchRz9wdSPsD/0vJn+VVxL3OnEjVm6MwN68ehNk8MNe9ziEbpgxzr/iHZULRUdcyrO1i8+Ee0VpDiMJpY0kP96qnGjNtriPnGEzOLL4=
Date: Mon, 4 Jan 2021 18:33:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/devicemodel: fix test for DM_OP availability
Message-ID: <20210104173335.h3kojpev4hol3xxp@Air-de-Roger>
References: <20210104141202.71724-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210104141202.71724-1-roger.pau@citrix.com>
X-ClientProxiedBy: MR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::25)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddbebd0f-50fe-4a5c-49a1-08d8b0d6dfd3
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5356A76AD86F9C10A72A87538FD20@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHhlTNHGndlvzxEdNa2k6FYZlMdYpxXhQRFMR2oRI4N1TWyPQSD/1Mf6Z30+d9sO/iIQCrekWqwsGqIaP6PbZUjYbKXsDMrNdllAT12piRQ3/AmyLhStm/MLyhuAujx+gSBo2snE8EiKrtrezNY6JGq5WtJ52ThjFlx7IofzZK8Y9lKsmQZRda7PJAIhg590FeIxYQUFGnoD/I4NkubJts5FfxoIIzxmGOv/lJmkqm1b9llnme2Y1TUe0/waVzMbwXLwzbuSLpXf6uDRzw+lRf5+YzPmDwu1U49aoSKBhx8LMANciAVsvFtAHLC5QrNgJ9HIlC0xvFkDsKiZV9c57UAXc0+HjEviqjNOhojOmRaMLjH5qGmGlffNZu10UG6rQhyzWX/yV0cr1iQ2o0Gbjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(396003)(136003)(376002)(346002)(478600001)(4326008)(6666004)(8676002)(33716001)(6486002)(9686003)(956004)(85182001)(316002)(54906003)(66556008)(5660300002)(1076003)(66476007)(86362001)(26005)(4744005)(6916009)(186003)(16526019)(6496006)(2906002)(66946007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tlc5MVIwdktEcUZVZFFRSTJUZ052Q1NKU3BUQStVUnNYdldwbDk0YVlKNlU0?=
 =?utf-8?B?a1FDZ1JxN2dxakREWG11bTA0WFpyRVRmWWE5TmthbDc5NDM0dmk3dnJXL05V?=
 =?utf-8?B?cXNZbENxWm9YeU1YQWQ3c09ndmVGZjFaM2UzSU81bjdDZXMyb2VXVUFsUmZx?=
 =?utf-8?B?QXNNOHVjcGF5RjhEdERvL3JBUjdNWGJLcTJ6ZmJxV1VmVjVITDlDMkI1RUtV?=
 =?utf-8?B?Y3R3NXVtdytjZFprRlNWNzVrU29LTmpuSmZBS09sTkkyM1Z2Nng5VFRYTGV6?=
 =?utf-8?B?cy90YWNseGd1ZUcrdkE4VS96ZWxNU2FjQWNVSjJ1NCthL3lyVEROZjZsTFVS?=
 =?utf-8?B?OWFKMk9pQnIyL1AvZm13OCtlaW95RGx6cjR6MGhza2cza1g0ZVZBRUhBellS?=
 =?utf-8?B?YlAwZWRiZzF0MkNORUMxYmFxdnRUQVJSdmUvbXJHZE0wanRoaXRQNEErL0ZC?=
 =?utf-8?B?SzVleFR3WUdYZldlci9ZU0JjR1JYaFZHQi9kdXV0MDI5eS9ySmFoeTlFU01u?=
 =?utf-8?B?ZXpka0lsK0NBNjJubm9aWk5qeFV3WExkTVh4enhTS3AvbnZxaGlSYUttbEJP?=
 =?utf-8?B?YXhBY0ZtQXpYZjJtSzBSSTBuS0UrbVhtMTZUaFNNRCt1SFlQN0hmak1ZMEV2?=
 =?utf-8?B?VnlRSWdSeVVnZDNwVkN4TStYWjg4QVhrR0FzMVYrNitSbFJoSUdueEUxQXla?=
 =?utf-8?B?Tks5NklNdHVSR216NnRjTFFhVXZBLzF4L3BpMmx2R1lMeWl1MktPMjNvUDFs?=
 =?utf-8?B?V243azVqMXEyVXFKbGRkR3ZzRVp4S04rSnJweVJZakxuL1g1TjFibFFGdWRa?=
 =?utf-8?B?WUNlb2ZSQWtadE16YkJaUDNqa3pSNDYvejZNZ29pWDMrelNQTlpFdWUvWDRK?=
 =?utf-8?B?NW8vd01LMEtEOXNDL2t6WEdrcjQ3OXE3NjZvcU5UWHpucVJaNDRtWWpaY3Q5?=
 =?utf-8?B?akhpck1adU8yVjBNb1g5UlB6VDZvOGQrOTJja3N3cFppSEx3Vm4vLzFXalFp?=
 =?utf-8?B?dVZ0QWdhUTR6YUhkVmUyUGZjb0JGblRFdUJTeFdwREpjZHhLblNuQTVOVWV3?=
 =?utf-8?B?dThBbXd1bVRveU82OVVDUk53bjVUUmk5UDBlRHlMS25QdFdhZlpRdmVUM25T?=
 =?utf-8?B?cFNXS3hDYVlRR1MxcldkTGZyVUx6c2UyVWlROUladnVPZENEbXM4OG45YXdw?=
 =?utf-8?B?a0Ntc2xlbytXRjRXWlBNditadVFPdlZtQmsyRjIzK0R4UXM4UWJQeHI3aUIv?=
 =?utf-8?B?ZVFpdm1QRjFGalpQWU00dWt6czRuNWtFQk5VS2JadktyTFZncTRXdzgwWjF6?=
 =?utf-8?Q?gOX8HazKrVBarrLWbtkPHuWa4iE6SGescp?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 17:33:39.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbebd0f-50fe-4a5c-49a1-08d8b0d6dfd3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/eD6SKVQGSiWEcH2xdnD3Z31h6irbQADdavRo//2Y26pYmL1dYs9FtJ8M+h7RL+KanycBkLSmT/zhjMudzlvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Mon, Jan 04, 2021 at 03:12:02PM +0100, Roger Pau Monne wrote:
> Current check for DM_OP availability in osdep_xendevicemodel_open will
> always fail, because using DOMID_INVALID as the domain parameter will
> make the hypervisor return -ESRCH, which will disable the usage of
> the DOM_OP interface.
> 
> Fix this by checking the errno code of the test ioctl against
> the privcmd unimplemented errno.

Forget about this patch, it's my fault for not realizing Linux privcmd
checks that the num is != 0 before issuing the hypercall.

Sorry for the noise.

Roger.

