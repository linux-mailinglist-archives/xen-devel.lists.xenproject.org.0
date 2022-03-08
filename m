Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BCF4D199A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286898.486600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEJ-0007xC-SB; Tue, 08 Mar 2022 13:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286898.486600; Tue, 08 Mar 2022 13:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEJ-0007vM-Ox; Tue, 08 Mar 2022 13:50:23 +0000
Received: by outflank-mailman (input) for mailman id 286898;
 Tue, 08 Mar 2022 13:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRaEI-0007uj-HY
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:50:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b14eadf7-9ee6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:50:21 +0100 (CET)
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
X-Inumbo-ID: b14eadf7-9ee6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RFoclzFWHJWdzzqlD8wGYy+jZlMc8vH1iUk1TVEYnUQ=;
  b=cQUE9pLs2bhuI+hQWfI/FJKGB3NPNQKKZk0O3iktv9+C7RSHe0BHGPpD
   txY9JJfhEgQGW4ykBZg0NUh5f9R7R01XzlSnSAd4RNSbLY/Mao2ceFAJk
   gKtPdHNLNDjVhqZaYviWimcFGtHuJK8W/98JPrZ4HMqexlJANyzZuW7bV
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65712261
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YaZIKaNxESTfkgbvrR1Sl8FynXyQoLVcMsEvi/4bfWQNrUp03jIHn
 2UXWG6HaPiOMzHwetgnadm/8xsCu8XVytdjGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2t4w27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 +VDhKGVEAgTEbDAl+oyAjUGOXtXBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmpv35oUQ6+2i
 8wxTgNuXUzCYRp2I2gUVZ0MzdezgmTZfGgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt8Hihm+vOliPTQ58JGfuz8fsCqEKX7nweDlsRT1TTifO0kFKkUtRTb
 Ukd4DMzrLMa/VauCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRuwJCwUIGkqdSICCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWpIUdvPMujqqB0k3LjDyD97SXZFQc31CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQM3R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6ex3lcAM9vy/D5g4i+aihLArLGdrGwk0OSatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz+NG8+rkk/+gefFDJJwdVvjGAHVBgzexPnYyDg5D
 v4Fb5fao/mheLeWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeV/pLw5k68uF
 KVtlgfpKq0ndwkrMg81NPHVhIdjaA6qlUSJOS+kayI4ZJluW0rC/dqMQ+cl3HBRZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:SP6/+qkMyFRQtt/M6fZFaZn6xXLpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65712261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw81FjQzhQjXHaTbGrSfbKOc2imQASPLqz1XepPiW6bzWQx9VD6EFGBqKpKYUH7fuOJwDPYTXu4B0qJ/auHkJwEsbnCAYszTnpgFNraB2T9B6dF80qYtOhnPwbkyOSo4Bga8H9q8pO0rN3S/LKBxSWBO9BkV1eedc3mLLGER1rg3bCRw7Jrv6zzwn+yIOx4eRrY4KNfDpYJm5aVvMbn+lO7hB3TbnlX7Tb3eXzEC4K8rpMJMbXGUzLE49TbPPiNZq4K6oVxdqQ7Zj/ivxtrGb2oxPaO9K+NsqiPO9ZqvldKWYhCegKE/kC/PWP6cV963h3Br1lXO2tXge0nYcHTGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV5x7p3LQ3FyFctfMgc30qka83QbDX2enU8JqcNIJaI=;
 b=aEUA1CNRyzr6/yHwoRMZmSTDO8AFBE0TD6T9qriAarwD/3zmZDNPipnsi89RTvaC2E4UIaEfI08PPVWxrPethXspVeN6J1QTJZO9oo8ySr8qznyIaZ/W7UP7wxLaj1gIaeIH9v9vBIYjpuFeDFaz+ZGC69i2QKLK/5umFCR0Ys9UX3bjFpOTwItt9iMg9Yf40Dz6j7YfiNjqiZpi0j3QqYSRxJ+XJ6VhhZ+jLSdDFsbzRkOtO43/DUHcxAC2FAmdAtj82Za0tTyxXGSTEi7xugCVT3kqaogOgHt15OoJ3VymIRzwZhcX8eWBoDbL6vmI9bJS6lBvs3VrtzgGsXWq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gV5x7p3LQ3FyFctfMgc30qka83QbDX2enU8JqcNIJaI=;
 b=DWO0QOK+CHSJdNyhUNXh63eY/BVPzHKfLf3COlz5lD4fUUaRdpYFkHw9ccW0+CfBkOtcgaM043g4huYuPyJWHiuWB2pIhZWy8oaiza7lTH0L28yXGPjdQ0AR7UMmL6V15rp3sKcdrTOpuQT4Om2uO6QljbnTkQ9Ynlt/rMZSvhU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] xen/build: put image header into a separate section
Date: Tue,  8 Mar 2022 14:49:23 +0100
Message-ID: <20220308134924.83616-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308134924.83616-1-roger.pau@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1156d19-057e-4840-8556-08da010a9041
X-MS-TrafficTypeDiagnostic: DM5PR03MB2618:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2618DECD496792FCA006DE2F8F099@DM5PR03MB2618.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFepxCtNADByo1XOVCRLStGNwM3xrmc0zsOmBK/ee1osOkCgUna+RbNLH4L+U3ITJnT2Sntg/0+chCW0d/W+Vg8ygWXnKBPzTwASP7h3zls+stCPlaq0s/S/6UFwtJSvAapX5q4KtrwwHrGAvfPB85vTTH93IgS9lCm6zb3ubgwtxacU47+s9mxkp05ytBxd+Mgk0aHdJ6t1OMXQI21VtA9kL4vQLLQGTHylNCAHPK4DkV9OzkMTwFxdLUc9Gt7Y23dkreFh7Hvye2tpA98BBoYNVkeR9SrtyAEjjFL/tohVXx51Q5MsWgp8GKju3xurVVef1/5GXFbZdgG0ROJ3VEhcImkD+yG4/c0yeThmhF2CFbaPfUN4Gf1W0rRZnrw3rgG8GsU8OFMhPm5XPQivU3VOLY0MGIcdEX13cvEZ1x3aMVLG9Lq3eNMMmMCXl7yeereAfj4/ECWVoEt0qwfCpvhc3qmV+4QHOgOF/e2PDJr3FJDwG1UMFuf0TZrwnLKDX1w+t9eiQlIYQ4KhdEwaxYl/jsPTBaFIi7Fb/fyYlan6eAT77Uj91I7vJz3oP6XnldYFGTx9HfbVWAhcj43k5igCxaGWgdzX36J5ZUcTJXjVyAs/4WioyK5SGlhXkWOnuT6FwHEy7qL3UCi6WwfcSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(4326008)(508600001)(66556008)(66476007)(8676002)(8936002)(5660300002)(6506007)(6666004)(36756003)(6486002)(26005)(2906002)(86362001)(316002)(186003)(38100700002)(6512007)(82960400001)(54906003)(1076003)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHhmQzZkTUNBV2wrZndpVUlZNFI1T1QxQUxDYWhGb08wWXk0Z2FFTDJUdm53?=
 =?utf-8?B?NGNUQ1ZMemNzTmJ6TUU0V1NPQjdIR0xFajc3RlFQSFhZZmRQTjdMNVRPRnJS?=
 =?utf-8?B?Nk9MUkpZZG4rSGcrL1hUSlZjeWg4bjRkNysyT1ZDQnZhNDFnSTltelNtYXVO?=
 =?utf-8?B?bWlRNkQxTWxVOWc2NWt1VExicWRvcWs1RDl2dStBMkNiRk1SQXZ6dHBHUUdF?=
 =?utf-8?B?WW03USs5YStpak9rZkZkYXVxWWRmbFIyZWdtQnEyeTN5UXF1bDlZcTBCa2k0?=
 =?utf-8?B?UkR2UEZSZi9YUUJzUFhUWUMzWjduTjhkNDMzcDhmRjJwcmViS1ZLVTllaWc3?=
 =?utf-8?B?d0ZlQWk1K3pTejBBekFIOXBjVzYvR1ZoSDRxelJmZ2o4THd1WkxtNDhCN3pW?=
 =?utf-8?B?Z3hRZXhBaWo1OXZPMGwwRXFRcjZlekp1R2w4T0UxSE5iczBGbjhDRUI1SDl1?=
 =?utf-8?B?aXhWVVZGelJJSW9ESURjRS8wRk9CNWwvS2ljZkIrZ2hTeXZDL1AxMDFiUFVm?=
 =?utf-8?B?dkI5L0tmOTMzTml4N3IrcDJzRTZFU3k1VWRZYTJTaTdsOTNxSzh2a2d5c21M?=
 =?utf-8?B?KzdhVEZuMUVoekFpMHR6aHNLVHNRcTRJeis4VGdoWWdURFZ6bmtNdGkrV20v?=
 =?utf-8?B?eE03YVMwOVVZUnhRVFJkZWhDZXlvdEFUZXdlV0Fsc3BpZTVvL0toT0lweWpI?=
 =?utf-8?B?aTg2MHBuc1VZajVWU2ZwUU9iek4rVnN3djk0OHRyazRSNVFGZVlITXIrQkxL?=
 =?utf-8?B?dUNISXBSaDFzNWdERVprVGlCYSs5MkVqQng1S1RHRjJ0UE9Cb2Z3Y0dJeHhX?=
 =?utf-8?B?Vk5ORmNBSWV3QUhuZ3Q1VDh1SzU4czRsMlB0MTlVKzB1TmJiYjcwMEhadGFQ?=
 =?utf-8?B?MS9Xc3RQZTE5L3hwRzI3WGFON0IrRnVPam8xWG15THd5R1F0UXJRU01GTnNx?=
 =?utf-8?B?eWg4UnpqZWp4eCttUHp0aE1IcWtJQUgvaDZma1BpOEdIVVNsM2oveURPWkwr?=
 =?utf-8?B?RVZYVVJ2blhSQ1hzSStWc2tlbmVBYmV4d1Ezd3lEOG51OWlFaXRPSjNqSzJ5?=
 =?utf-8?B?TlpsemFxZGE3NHN4WWpyYUpkcU52cnE2V1dMTmRMcXE2SjZtTDErOGFoTUJk?=
 =?utf-8?B?b0kydUVQS05OODVOamdWS2MvQ2JMZkFDNi9DdHBVc3BCNGJZUFpBWWlhMWlY?=
 =?utf-8?B?dVJXdFYwSkhQazhMbFVYajlFNzJJTUZ2WDdlZSs4UnlFVUpHVldMMTFHMjlB?=
 =?utf-8?B?MXJxdDhVeDV3amNTbHdzaUdXdFF2b1U4QS9VcEpzajhmN01aaFdER3lzdnlz?=
 =?utf-8?B?TjNOOUFGU3c0dFV3MTRrRHpvM21QUTg1Y1AzeklUYTdFWGxlaVh2OU1GaFNj?=
 =?utf-8?B?Y2FNZHlidjRZanJjS2Fnd1Q1NnJzNVk4bmpFUjBtWFJkUXYydUhaWGVwb3ZW?=
 =?utf-8?B?SFVnMzVwd3ZnSkd4WjkrbVk3MXZmVXF3bW40NWxjczU2bjVTM2kwOVFKbk1z?=
 =?utf-8?B?N0t6eXhCeTd1aGxHbTBSYzFncTdwcGI5RTZneldqZ3dGM0lXcDNLUFdsTDBh?=
 =?utf-8?B?QXJlUVFSNkpzZzlHQWJoRXl0M0NrN05zQVAzS1lmdlNiWWxaMzBaaHA2MERy?=
 =?utf-8?B?SGlFVFBWZ24vVGVZeElHWFRuZUo2aXIvS3R0bkdSOXJNSWRyNG41SlQ3dHkv?=
 =?utf-8?B?cWl1WnBBMWZwVDN5aXRoYUFQaDlZdFhVK2NtdHZueEVyNlM5Y2ZGaitlakRx?=
 =?utf-8?B?N2pINVduaG0rRFVSOEVRZXVOUEUwZ0VFaFZVYVVqelhSd2dlbUN6UTFMeitt?=
 =?utf-8?B?ZEd2cmcybXBCRjI2NkluOWM5aGdMTm0yaWI0a0xscWQyczJiQ2VmeEowei9j?=
 =?utf-8?B?cytCMFZ2VVM1UVBsTHd4RXMvanoyTms0bERqemxNN0w2WHdMcHlXRVJvYmYx?=
 =?utf-8?B?VjBld3JhUFd5aXpvM3ltNFkxekIwc2VFWnpEK0UxdWd2dzNvczV0RzRaRTB3?=
 =?utf-8?B?aGV0MzQrTklFT0VOL0dYdDRkakQ4MEM1OElVNmN5cE5WU3lhSGQ0L21Fakg5?=
 =?utf-8?B?WW9XWGE2aU9KR2ZxUmhlcGFDZFBYMnBEVktxKzFPR3pBK0ZsTmU1L0JHVGVr?=
 =?utf-8?B?ZS9qWlFidFNWcEJreVYxT1o1RUIycUJsL0VrV0Fha2V2N2hIdys2c1g5MldU?=
 =?utf-8?Q?NGVfxLkONgHULjNCwPq7WUo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1156d19-057e-4840-8556-08da010a9041
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:50:10.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkbb6LqrrKVTtcSaqZLhlO5zoVy1MfJigX8KCqAtPxBfQBdxEB6aTMDWBiWcsyS4/HBTExgjXfKxO878q62AZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2618
X-OriginatorOrg: citrix.com

So it can be explicitly placed ahead of the rest of the .text content
in the linker script (and thus the resulting image). This is a
prerequisite for further work that will add a catch-all to the text
section (.text.*).

Note that placement of the sections inside of .text is also slightly
adjusted to be more similar to the position found in the default GNU
ld linker script.

The special handling of the object file containing the header data as
the first object file passed to the linker command line can also be
removed.

While there also remove the special handling of efi/ on x86. There's
no need for the resulting object file to be passed in any special
order to the linker.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version (split from patch 2).
---
 xen/arch/arm/arch.mk        |  2 --
 xen/arch/arm/arm32/Makefile |  3 +--
 xen/arch/arm/arm32/head.S   |  1 +
 xen/arch/arm/arm64/Makefile |  3 +--
 xen/arch/arm/arm64/head.S   |  1 +
 xen/arch/arm/xen.lds.S      |  8 ++++++--
 xen/arch/x86/Makefile       |  5 ++---
 xen/arch/x86/arch.mk        |  2 --
 xen/arch/x86/boot/head.S    |  2 +-
 xen/arch/x86/xen.lds.S      | 13 ++++++++-----
 10 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 094b670723..58db76c4e1 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -23,5 +23,3 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
         LDFLAGS += --fix-cortex-a53-843419
     endif
 endif
-
-ALL_OBJS-y := arch/arm/$(TARGET_SUBARCH)/head.o $(ALL_OBJS-y)
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 3040eabce3..520fb42054 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,11 +4,10 @@ obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
+obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += proc-v7.o proc-caxx.o
 obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
-
-extra-y += head.o
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 7a906167ef..c837d3054c 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -120,6 +120,7 @@
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
+        .section .text.header, "ax", %progbits
         .arm
 
         /*
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index baa87655fa..6d507da0d4 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
+obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += smc.o
@@ -14,5 +15,3 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 obj-y += vsysreg.o
-
-extra-y += head.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 66d862fc81..e62c48ec1c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -133,6 +133,7 @@
         add \xb, \xb, x20
 .endm
 
+        .section .text.header, "ax", %progbits
         /*.aarch64*/
 
         /*
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..47d09d6cf1 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -30,9 +30,13 @@ SECTIONS
   _start = .;
   .text : {
         _stext = .;            /* Text section */
+       *(.text.header)
+
+       *(.text.cold .text.cold.*)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
        *(.text)
-       *(.text.cold)
-       *(.text.unlikely)
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 9c40e0b4d7..04065a7310 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,5 +1,7 @@
 obj-y += acpi/
+obj-y += boot/
 obj-y += cpu/
+obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
 obj-$(CONFIG_HVM) += hvm/
@@ -77,9 +79,6 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
-# Allows "clean" to descend into boot/
-subdir- += boot
-
 extra-y += asm-macros.i
 extra-y += xen.lds
 
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8e57476d65..c90e56aeab 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -117,5 +117,3 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(srctree)/include
-
-ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10..92d73345f0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -9,7 +9,7 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
-        .text
+        .section .text.header, "ax", @progbits
         .code32
 
 #define sym_offs(sym)     ((sym) - __XEN_VIRT_START)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 506bc8e404..715452aad9 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -73,9 +73,7 @@ SECTIONS
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
-       *(.text)
-       *(.text.__x86_indirect_thunk_*)
-       *(.text.page_aligned)
+       *(.text.header)
 
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
@@ -86,8 +84,13 @@ SECTIONS
        *(.text.kexec)          /* Page aligned in the object file. */
        kexec_reloc_end = .;
 
-       *(.text.cold)
-       *(.text.unlikely)
+       *(.text.cold .text.cold.*)
+       *(.text.unlikely .text.*_unlikely .text.unlikely.*)
+
+       *(.text)
+       *(.text.__x86_indirect_thunk_*)
+       *(.text.page_aligned)
+
        *(.fixup)
        *(.gnu.warning)
        _etext = .;             /* End of text section */
-- 
2.34.1


