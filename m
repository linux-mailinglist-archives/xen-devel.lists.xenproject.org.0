Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB92F7C5F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 14:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68078.121783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P1G-0001Y4-Hp; Fri, 15 Jan 2021 13:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68078.121783; Fri, 15 Jan 2021 13:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0P1G-0001VJ-Dh; Fri, 15 Jan 2021 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 68078;
 Fri, 15 Jan 2021 13:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0P1E-0001N5-NT
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 13:20:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 812c9d2a-762a-4e20-9094-6abe6bb08407;
 Fri, 15 Jan 2021 13:19:58 +0000 (UTC)
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
X-Inumbo-ID: 812c9d2a-762a-4e20-9094-6abe6bb08407
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610716798;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GTmMmtXVRRY70da95rzc0Mz7BJBBh7zkdmMi9qn8RX0=;
  b=THzD7ZVFzpSGWn5HZiG3wMcp0m10x87RdXPlx8QO8Pj8o0fAmeK0PxKe
   kQNZ2tsFRyF8JzR2NmgKFy+aBZJ5qfNIFCKFYfEHWnlHb92+37wiBAoiw
   BFerc7iXIKKGaf9hpP6WAPuXNaSfhkJH2Poiq0g9P7UQn13PvhH0d1bwq
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Kv5eblr0eOLCTEpcN/7mYVNK0NSz3owu+a6k4owYENdI4kyJpTGQ7baiL+exnXZFFa1z3SxHnm
 1ODahBWpaV9F6cANObb1TjjnjsdeY7OUf2wfpJ4k6//4iNA7QBqBQIfG6n0h4YvolWpsqrroGj
 kLnHWspTig71VBK5hUYTMpx7yMerFVpWlyA2/9xZjVHVJwwwSRlRq+DXMovb65zV6CDJPmknu9
 Jy+qFWMW+yp/Ku2zZ7Mj7atyM4P1QJkqiyAvihPAD5RPlX+jEfyAOu90DElb7C5uDdWQRE19u3
 5AQ=
X-SBRS: 5.2
X-MesageID: 35542382
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35542382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhOeZdj8cjGgY6m8k1pLMEAQdvNWI8uPGVSXSanlX/Xh1HQCiHTAVHP319kc54B8T5uI6iE63eOg0paymmPE9DuuvRjKmdQUVS5ObXsazwomkMheWEUpYRAlvdOFp/NM1ZCc9pCSwHOG+IGXUWC3r8xYHEq5ZH6Q6djT7TLpAkO75J4ZuywgWLd2U1u5bLrMNkd4F8sm6WEW8MeXsXSKOxAD7TSElgKa2ylpkNLgyGWJ6QTh99+tywXNkPBSjl7ICwv1ALiD43B9Cp4HEZ8lw5oTkeyF8dX4v7McR1X+zWM1MuXcq3Re/hKlCUaOaKoU2WxNsuJTdrsKyFkF+77pzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9oZDkfqnanPlKkCw++VGDbDCCzmtk+Lb0kPDRwvNM8=;
 b=jXEs30vJyGLpTrbSratE12qt6U3VLASjqAhyLEBpJCyRaRxg4oLX1xFlDEvYdzEUEXAKlKgrgsVOChCHFcDaioJU7dv/fr8f5mN+lIogajYPJ56SDFhfpLFMjTgpDi63eZFmkyZBQZBPy3VnwpbT37TLjHoAEKu5g5MNbGPzNkcgvzacv/mnWDxrGa36mEx3ncTwHPyC1eUFzAkhTu1LhcTQxVCvg+XqrB8MfQocr8vQxPrEfS/G1/wymKPXTsgzm68j8LrxJWwA4W+ZMOIZoPaFsR93ve3u8onYmBDuMSuhKrWZ4V0kazfDEvY6GKheadx7jTP0zpHSvr6rYR9viA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9oZDkfqnanPlKkCw++VGDbDCCzmtk+Lb0kPDRwvNM8=;
 b=GnP3xkErfceENs+ulZ0R2o9otpoVi3Hb2anwlfBa2QAa1GrKAdHCrbBXh4cP1Xk/yv9DZmm8WVk6cPzv85RAPtIg5KK3P55ox6HRSDuLTcGgB2EADvwPpvRcuPUOPKCnfDNrrSPfYn0Gdg1jFQD2o9r7xniOEwk90V5+K0UGDNI=
Date: Fri, 15 Jan 2021 14:19:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210115131945.3rasvixu7ezpy7tb@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <20f1ed79-89c5-d4a3-5b12-af82bed2dc1e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20f1ed79-89c5-d4a3-5b12-af82bed2dc1e@suse.com>
X-ClientProxiedBy: MRXP264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484f28d3-4163-4af9-5fbb-08d8b9583fa1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4540236856FBD7F740123ACA8FA70@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psnZVsgPX2GAOPoOUCZ3+qTIiLBQwy1BMJPGJvi9wshZN4TZHc3Ake7MwOpiIfd6bns14MV3XuH3ymEh+p927xXd5j56EbHOJUm+pSTCXQhfVEO+sj1IzX8/9dUN4wGVe4t0hOiTJsyty8zgnVDs1kTzEKcS7DhDl4EDy8UOwn5y7SSpZb0nz1wkKy9/VYiYi6iF4dM/iDZPfWogcsEQvyKd5AE+1IAy65gQu2R18Yyx1NQH++H9m8fGo+KEaxnfpvcYveg2/qOL9BtNFjcafIkNKvA0nE9W+FZ6wepFcryZSBIMYuCwVpJSRn2Itezu3vhtvR5vooqrh/stKlwIXP26LcPl33mGMmPpem+N3vvbeyv5HwL0aqxA76kdblst4PMVjf2fi7Xjt+CrHHSvzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(1076003)(478600001)(85182001)(6666004)(6486002)(86362001)(956004)(2906002)(4744005)(316002)(6496006)(8676002)(5660300002)(54906003)(83380400001)(186003)(33716001)(4326008)(26005)(16526019)(66946007)(9686003)(66476007)(8936002)(53546011)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L2VHUG9ybDFmWWliQTg0eEdSdm9raENoa0ZxMk1VSnJRTnFIeUh1cXZ1NE5v?=
 =?utf-8?B?d0ZGdXZHNklvTGpZTXBOdHpBZTlUN1Fya1dxYktyaklNTlByb2dZSGVWd3Ny?=
 =?utf-8?B?T1RhK1lGc3NFQ3JnUzhsTEN5cFVuakxjTXJpcDhteE5NaGpiMExvVWVvcUYw?=
 =?utf-8?B?eStjNFpiTWJ4YWlrQzM1TlFZRks3cVI4MVVGRnl3SlFiM1Frdi9YcGN6dGE4?=
 =?utf-8?B?ZjA1NVg4VGdWWDhoOUFLeDAvR2ZrcXA2SXpGays3UmxDM3RzVHVKSmw1VGlj?=
 =?utf-8?B?dVRCVFRkVHh5MTNSQmgzYjY3VFpleGtIbHpLcnNTajBHRVZ5djZCY2kzZDVQ?=
 =?utf-8?B?S2o5d0d3ZUMyUmxGVk9Wa215N1VHZU40RklTVmJwb0pMTFRZTmlJVzhvUitS?=
 =?utf-8?B?SndyMTUrZVIzYzl4R2RhOWx3Rml1TzBHSEZNencvY09mNGh4Y2ViY050eUNJ?=
 =?utf-8?B?c1RjVFhteGJuYlVTbTdVM0hsdU9vbkVIUHp2RVFzQXNYZjZkVzR1UkJ0a2JX?=
 =?utf-8?B?MFBqR1Q1QkRML3lCeXZnQ0lZRm5ZZFBOSFIyaGdxM0JlaVczL3ZDdmx3UzVP?=
 =?utf-8?B?Z3VvVXVnU05IYzU3QTV0OFJCbnl4Skhwdzk3QkRkMlFRanQyY2REYlNRbUxZ?=
 =?utf-8?B?b29iZDVNZ2xkUG84cGVRTEpRV0FlU1VyekFCVVN0KzFFMExUTUc1UXJyOVZv?=
 =?utf-8?B?V0VIRThtaEs4U1ZCbTluajNXVWhSbGVNY2pIM3B2QlREWVFvK2FqOFRuNWJo?=
 =?utf-8?B?cHdiZDJpejRSd1oxK2E4emdzZk1mR0I1MTJBSnRSb2dtNkpWeEhPSXUwRUNk?=
 =?utf-8?B?ZGN1RnNZUTdnVXBOY3N2NkpzYnFIMkFiNG03SW9wN3A5bmdtcEVhVHVycTFM?=
 =?utf-8?B?VzhZY0tRaFR5ckRvLzVUR1E0eSs1UDh2em5Yem81S2tkZWpzUGFWa1FzbGFU?=
 =?utf-8?B?MWZBbVMrRTlHVXBKTC9rUXJpdDV3bTVqMTlpMHdSdlRIL3pobTdnSHAwWXFN?=
 =?utf-8?B?VVIxaVhoS3g0TTZHaDF4VVI5NnU4NGxFMVlJazhqWkZRZ2xDMnhlRlZjWnF3?=
 =?utf-8?B?NCtheE5jZTYrcVk4V2R5WmFwK2NBNnNJLzhnQjQyQVg4UUo2aUNtODdndnQ3?=
 =?utf-8?B?MlBCOTdyYklROEpveXJjc1A1MXlQZXkrUnFHMU9lTkhlTGQwZEVnaS9PUTE5?=
 =?utf-8?B?M3Q3eXVkY3l0cVRzT1Yzb0dMR3FhV2QvVDlJUTkzTU9PUkJmU2pzVmdoaitK?=
 =?utf-8?B?WTJMREhPWUx0dGlySndGVTVSNlBRWi9GcU5aaHk1VGZDdnl6U3hMeDBXQVNp?=
 =?utf-8?Q?TMhD/iZSD2lWrtx5T+8oUoB4fgXl6hNe5+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484f28d3-4163-4af9-5fbb-08d8b9583fa1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 13:19:55.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8n7u22jFkLhRZKhrU/j7o+0sCQMZM3pLRI0imrIQkIu6iOJc28rB49vh5UERbfm0Z1H6MHl5HoxcPVW5e7esg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Thu, Jan 14, 2021 at 12:54:22PM +0100, Jan Beulich wrote:
> On 12.01.2021 18:32, Roger Pau Monne wrote:
> > @@ -967,10 +879,10 @@ static void hvm_pirq_eoi(struct pirq *pirq)
> >       * since interrupt is still not EOIed
> >       */
> >      if ( --pirq_dpci->pending ||
> > -         !pt_irq_need_timer(pirq_dpci->flags) )
> > +         /* When the interrupt source is MSI no Ack should be performed. */
> > +         pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE )
> 
> If we settle on this timer being possible to drop, then there's
> just one cosmetic issue here (which can be fixed while committing
> I suppose) - there is a pair of parentheses missing here.

I will be sending an updated version of this patch in a longer series.
I've added the parentheses instead of keeping pt_irq_need_timer, as I
would also like to get rid of HVM_IRQ_DPCI_TRANSLATE at some point and
then the change here is straightforward to perform.

Thanks, Roger.

