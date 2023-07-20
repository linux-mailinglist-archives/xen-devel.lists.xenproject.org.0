Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA375AB39
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 11:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566505.885404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQE5-0001qQ-VH; Thu, 20 Jul 2023 09:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566505.885404; Thu, 20 Jul 2023 09:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQE5-0001nD-SL; Thu, 20 Jul 2023 09:45:37 +0000
Received: by outflank-mailman (input) for mailman id 566505;
 Thu, 20 Jul 2023 09:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMQE4-0001n7-6E
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 09:45:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b14a236-26e2-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 11:45:34 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 05:45:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6569.namprd03.prod.outlook.com (2603:10b6:303:128::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 09:45:26 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 09:45:26 +0000
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
X-Inumbo-ID: 2b14a236-26e2-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689846333;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WDw17wo2WaEO3ZHwr3foXg5KyzyWBpz8gEFMf7FMqGA=;
  b=GSCaHH2iV3tep1EWyEmk+Cd4vC8v0mc6CJ23FFSrYA7oX/2/MrUzPlpn
   Jyg0GIohsnJADMXBS4MdHZGeXRUcR4R/rrrXRSMuIrIxgBFxk8d7Ox+Mm
   fi75ljbr0Kl4WCavX2QsdI+cZ4Sp9R0CJU0qXhvPJ+LB5EPO1/B9iYmHP
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 115547412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5POsmagvQdDnH/MBqkFy7pb7X161VhEKZh0ujC45NGQN5FlHY01je
 htvWGyHbq6PMGKje9t+O4q2phsC68KGnYRrHgRuqSA0Hikb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWGzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tREC2xSaRejudic2YnmZtgvvOkhMsD0adZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiBd9OS+HhrJaGhnWq52kQWEw3DGG54tOe0GCMVesEc
 Ustr39GQa8asRbDosPGdyO/pHmIrxsNQe16Gucx6ByO4qfM6gPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESofIHIGZCQEZRAY+NSlq4Y25i8jVf5mGa+xy9fzSTf5x
 mnTqDBk3utCy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:ynv2KqHxiO7KlW1upLqEcceALOsnbusQ8zAXPidKJiC9E/b1qy
 nKpp8mPHDP5gr5J0tQ/OxoVJPhfZq+z/NICOsqTMuftWDd0QPDEGgF1/qA/9SKIVydygcy78
 ZdmnlFebvN5RYTt7eC3OH1e+xQp+Vuv8iT9IPj5n1pUQpdbq1v5w1oPAKWFkZ7XxNGBYMOE4
 aZj/A33QaIc3EKZfK+Cn0PU/PYpt3TopX7ZRULHHccmXSzpCqv8qPzFi6T2BoTOgk/uosK6m
 jEnmXCl92ej80=
X-Talos-CUID: 9a23:sUyZDmyUyARYMyBvI7lgBgVIOZx6dXr98k36OnTlJVcqcpCXV1aPrfY=
X-Talos-MUID: 9a23:yZVPvAaoD1JwxuBTjh7ph2EzFZ5S4eeELxojo5s/4JODDHkl
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115547412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZLld+6ePOxYBEiEOfiutWXS4ttAOaT9X+bG5KNjPs+pXNqwXkhM8zDOC8ZA2Tcl62h4OCd1MDyyeV1cZPlq26dRsRtE87+Jks+mAeTAfgV4VH2043GTOORrUE455H0TopXDyeYi2IIGgsmGXblqgH3xk9t4gti9mF8RLj3TzwStMfRC4QMtshumu3VoIKdC3u/obvnmVNGChHkwJh/UFuD8rNnLVce/iO2EB2YD9u1UmiDj+9BpTrckO1cSfvV1eJxBBJ5xM4M/8A8HNB6K3QPtL3kA4Jjnifx4ryjBEd+kc4Wx6azNuDThyO3YphgdJsqrQpWtECbZdB56oQ8aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE0F85uEAxd62xuUVo0COuuAbEvLmENkGtPEs/UfeaE=;
 b=NBp+Kos4nuKYH7iWPyAAEIFNUaJsK9cgfj8yNftOPZk0dn7DJ/h7dGUBkuWPBUCIb32DFWBkNpyIzL9Sf73ZoRqnHKfppUlfj7Sa7esEvtfM+hHkDYxuO4Nsa3ASLZrmINE2aq7KNwQ7W7YnVlIm4LXEuIpTe4/y9SgA08Nbwq+eKFvi7lw8J5PgRtrWk6g6nAmNuWSJDPkBYfdtyvK9Jniyf9jSNV8ggK+73rTdJHX1hSeJXHmU6JnSbS4Quj7olzN5hZmrjOYVGGokVAVIJBqwMGL9u6mYEYcbS03Z2yE9OSpoX2mGAvn0q/ljXe3h9uuNFUwYrbEDXaM19yd1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE0F85uEAxd62xuUVo0COuuAbEvLmENkGtPEs/UfeaE=;
 b=CmdyhEODBRtBsKQ9j3ytwCUxk3ftWfyzVtolvOQj8G3h217IfagHG3L5fkGFW4FON+zURH6O4vz1haagP9HaraCm0YRUb+K3PPXjazTBzlNEWGhlKJvyFfagHqHm857ytnPjUeertQ+FMi3G1hngjiLomvuWqnHo6oowZQg1l1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 11:45:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 01/13] pci: introduce per-domain PCI rwlock
Message-ID: <ZLkCL4TbE0sWZjd3@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720003205.1828537-2-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 207a77ae-cefa-42f5-466c-08db89060b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xSDcIp+W4Q3hKAILX8Z7Nmf9+SAc8Ra+nGSsF9BtL+7i5VX9jDxlxA+w2xaSh/PJPph/6l/2Y8g5BMUrYCLlYan1YR1ZGLToKzRI/6DbBM9Bh0zchNkjY8cdORzCZpOPE+77WYdoiv1qiJuNQuezU4YQonQ5Vp1rVlaUvLHX/B3Uxn37AaJPAMSITf+Z6B27X9zioxhiJzv8ODobP+bbEcfv6K2pNM5j6f9iIawm7Y115u6B0M/ro6F+sizBeKkkijBMvd6KehD/wV98hbWXVvdOUIlOd7DX6NaR1oD392rYp7RXz3juV1TOikVa1iQz85uGZwfZ1XkiZk9b/278VBHN42InL8k54JJvH6dgfC2SxqaeyD/6el0hNbjGeFaLzYY3768mTdl2JKk5sCciX1H8aX/ZtNnPFkITT3rgMybNUQveyLkGJrXsc6mSG9++RLWPKB4TCh0quu0YMpDAX1KpkQoFpJb90xLVreCLzZkKjgBqYjvxqfuD9GlM7Sr0fE2Ac9GK/D60SpK+h46YciiN2OxUMoDOJNYJ97elGWtHZn2hULD6HCaZbgszgEpj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(2906002)(54906003)(478600001)(66899021)(41300700001)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(4326008)(6916009)(316002)(82960400001)(85182001)(86362001)(26005)(186003)(6506007)(9686003)(6486002)(83380400001)(6512007)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ry9adjRFdTlxb2JPd0YxMjR3WWhQTVdMNzFnVUpBRFl5V09ITjRGQ1FsMStN?=
 =?utf-8?B?YkNIdGhBMWdlNjlRQkZTdjlYbGg4NUVkYXhqcllaMW0zWUFINkd2cUdKS0VE?=
 =?utf-8?B?QUZ0YVFlRGhSamE3ODFOalJnVmdEOURVZ2lOQ1BHVnFVVW5xS0NOZWU5allI?=
 =?utf-8?B?TVVLNUN2L3BRTXFvTDExL0JqZGtBa1QvT0xLbDdVeGhHWjhQaEZzOG9HTUdK?=
 =?utf-8?B?dzY2K1ZycURGRG9rc05EQWQzekFyTytVMXdmTEdZK0h6c0kxY1k5RDg4NUJC?=
 =?utf-8?B?Mk5YdlNFL3o5Mll6bnJvZzY1bjFQeGhVbUhIUUpEQ3FqMXBtbDYwMGJQQ3Zi?=
 =?utf-8?B?bC9nb05MR0Y4TXB5WGJCRkpSK0M1RTNNK0NmbDkvNDZaNXltSkMwT2VaZTdt?=
 =?utf-8?B?ZTdvWjZxODVuT1ltdjQ5b29BUFducm5Bck1lK2Z1WXdsUGpQMXAwV1owK29p?=
 =?utf-8?B?K3Z3MXRoWjhqRGFydExqK2VKUkVUSW9HanRqVFgrNnRuNTZ0amhSRDFTdDdF?=
 =?utf-8?B?L21FR0M0YkVKSHp0bGxZWS9QaUNIa0c3Q1liUGkyVjd3ak5YWUtCVERkWGdj?=
 =?utf-8?B?UGlIeU1vMUVyV3FMWGl6K0hZZjlRcmJrUVBOUTQ0aGVCMU13VDdPVmZ4VWJn?=
 =?utf-8?B?cURJZ2cxU2IrTExjakNncS9Qam1YRHZUdE5CelF5Sk1Cd2t6Q0xVZFdBQUt2?=
 =?utf-8?B?NFd2SXlTMXU1dmx1RWlzaGZFS0NkWEZzMTNGSEdIZlFNRHkxVi9zZ1hSRzdx?=
 =?utf-8?B?THdKQXlXN0l6UjU5elJ1UlMwWnkzZnpIVGYzZSs4bW5Na0F1RHk4dkF2V2hh?=
 =?utf-8?B?TmVRaGtjL2tqVTRkWXpMUUFoc0p2M3hzN2pUVHp5L1I0Ry9zZlJEeU1WQjFP?=
 =?utf-8?B?SXlpUHhMWVNCMnIxNmZTd0VmMWlrc1AxTUVIQUswUVZnMnhkMm5Manl3SVVR?=
 =?utf-8?B?eUpTU2VoblRPNVVGTmt5bk5LdUxKdVlBMXBnc29QL0dLUkxkclRXeTk1c2R1?=
 =?utf-8?B?VGdhQ09BdFM2RGZxS2t2TklvMisrWEhrMFNnNWFmTityckhwUU1JRjRyb2ZE?=
 =?utf-8?B?bjYxMjU5Z016bWlOSitIcldJTjgrRXpSTXB0YUtvdEFEYk5aQXNJT3NqMDFr?=
 =?utf-8?B?Z09LZ2U4NCtqNEFkVUFnSlBPOThZT2Rzd1FLRi8ycGVpL09JL0lZUk5IZ1Y3?=
 =?utf-8?B?VXBCZzVlTjg2MEVKYlBQOCs5Qk5MTFpQNkI1UUppbGVYbVdrZm5VNG9maWFp?=
 =?utf-8?B?S0ttMEFDWWFYWGw2T0xiRUZLN2R2MGl3RU44dHNlMm52dUIyMWE1TGtWU1BP?=
 =?utf-8?B?a0RhZ1I2cEdCelRVSWExOW1JQURsdDA0cWg4NjJqcVlRQU01ODdPa0F3a2Nl?=
 =?utf-8?B?YkNuN09xZWE0Si9rQmdPNnFkNjFFS2l1QzVyV2RBcktIaFg0Q2w1SWtlNXlO?=
 =?utf-8?B?OTBvclc5aTRBTnZhZm9WaDlwbEp5RUJuRlh1bzlUVVZQL3FzRkNXMVQrZXJN?=
 =?utf-8?B?Uy9rUllqQ29pNU8xQ0tTbVBmeUxsNjlrMWhPZklNVGswMG1GN1lNeHNodDZ3?=
 =?utf-8?B?dXhSNWlucHJCZ0R3Z2hQMDdjcEgzcXNmTGE5TGFMK3hlSFhjTmxFcXRESHBx?=
 =?utf-8?B?dGFIQ1NwNGh0blVpdG5kUkVXYlZKYnE2bmRta1owZks0RkRNQ3liK2t2Vjgr?=
 =?utf-8?B?UTk3VHYvRG9YSkgxWWU5Y016ZEFmV1hXTFZPOFozQkdCK3JhNkI4SWNnVEtG?=
 =?utf-8?B?K2dDWU1yTEk2cko5SWpmVnZaNjFCR05PVFBYd20xWnVXVE04WWJ1ZzRvOGZ2?=
 =?utf-8?B?dWxlNnp1ZThDRmFGdGhFaEhpSUQybkpwbW4yYjl6Zm5ha1c3UjVpNW5nNE13?=
 =?utf-8?B?R2FxcTc5YkpiVVV1c0xaVG00NzFpYngwMlgxaXFPUGV6SVJFVXBtMVJlOGtZ?=
 =?utf-8?B?REhyeHlKa2F3MEhFUU9EOHA4VkhxSWRnUEY1aUFSU05KZitWazA5TjUrcERi?=
 =?utf-8?B?M3FtV29ocTZoZlFnVzczOU1pUUZLRGZHM0puSnJuZ2s5K2tTZ0xRam9ZMzVC?=
 =?utf-8?B?dDRESDlCWXI1dktHSHpWb1lJQ3BKbjNQN2xrdFR6Z3MwRFpVTU90Q0QvMzZ6?=
 =?utf-8?B?aFVkaTcrWjRDMVpmUVhXWFlnWTFsWlIzMnRWRUxYTWllSEZZKzdEc2N0Zm1W?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6k9uBe5o7gk4Qm9JgDXZUTiyZg5RzvRueLNaMFmifX/lMdFVIJKTcRgr668OpI+UYcj2Xq3nAiF/Kz2mIdC1cFksXr5scdwKLvVV6N7uFKdsvZlN3Rzn5mZ7T+LZuXTW23J3YInfg9Gi61/duGZqtiZrXUQ/SLE5uinh0V8kn7X3EQa0KLIkpiAJqVoYTVuTfETrK1yuZpKgF7KH0f58L5x5V2jDPYgc7e/hXXfx18H4aLUI9pmV9R3X4LPl6Cqfd/E4JUieJBro86nStqJ/Ftn0Iq69xA7TZJzzhYPlEeKRieu7yN1EKdlTKjlPbev0rEHYTAPNSIS0py6/YCfG2J60nlLGtMLZXcwiwMLjT9vBMfM70LV1fAmpWelclgjarFufEj8USgCD45aampp3zCLORU0ek3gFM+C/TPQXKm535WGecAUuyPtPVFQY+266E/5dF6DQNB0lPjeBGItppvWrLoOK1pzeEbV/87gXwsgBBP/ZX8b2YpIPhMe9IHm7pEeCvz0n34riyV5CxdRRI4R/dFIiJg9gGqUQtgX7K6ytrmy4Wxq6Unzs2O/7dpoLOJvMDd/YWYdjL0oV0sCMnCUVhU/PZiwBCwR3WI6Iq7ZMdCOiO7+ljSmWwUMkiggiIjQ5oIPj88ZGbXymT37MqrqfAJLNj9Yzh7yiBfflBZ4lwsWM+K7kFVm+pFyDJehdtTk2X+6iBKF9SMXqvtqwl2dX08kvak/EaeuA9slmfby2b202jm2gBD/40cRS17VPx2uI+9hRgLJBcbjbuFeqgnHhQM0Tk5UqFwSpKt8JBsP6ahtx58YEDgi2B90Hzwegob0cKVHQ7iQCAx0Rxj0wQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a77ae-cefa-42f5-466c-08db89060b8f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 09:45:26.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvU1RTBg87QJN3RNJHcZsZE16OAGwQRdWOYzDClpGW3xOsDoo62rIcqKDxI/hzWK0ttLnwytgzo2Umy5NydZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6569

On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> Add per-domain d->pci_lock that protects access to
> d->pdev_list. Purpose of this lock is to give guarantees to VPCI code
> that underlying pdev will not disappear under feet. This is a rw-lock,
> but this patch adds only write_lock()s. There will be read_lock()
> users in the next patches.
> 
> This lock should be taken in write mode every time d->pdev_list is
> altered. This covers both accesses to d->pdev_list and accesses to
> pdev->domain_list fields. All write accesses also should be protected
> by pcidevs_lock() as well. Idea is that any user that wants read
> access to the list or to the devices stored in the list should use
> either this new d->pci_lock or old pcidevs_lock(). Usage of any of
> this two locks will ensure only that pdev of interest will not
> disappear from under feet and that the pdev still will be assigned to
> the same domain. Of course, any new users should use pcidevs_lock()
> when it is appropriate (e.g. when accessing any other state that is
> protected by the said lock).

I think this needs a note about the ordering:

"In case both the newly introduced per-domain rwlock and the pcidevs
lock is taken, the later must be acquired first."

> 
> Any write access to pdev->domain_list should be protected by both
> pcidevs_lock() and d->pci_lock in the write mode.

You also protect calls to vpci_remove_device() with the per-domain
pci_lock it seems, and that will need some explanation as it's not
obvious.

> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v8:
>  - New patch
> 
> Changes in v8 vs RFC:
>  - Removed all read_locks after discussion with Roger in #xendevel
>  - pci_release_devices() now returns the first error code
>  - extended commit message
>  - added missing lock in pci_remove_device()
>  - extended locked region in pci_add_device() to protect list_del() calls
> ---
>  xen/common/domain.c                         |  1 +
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  9 ++-
>  xen/drivers/passthrough/pci.c               | 68 +++++++++++++++++----
>  xen/drivers/passthrough/vtd/iommu.c         |  9 ++-
>  xen/include/xen/sched.h                     |  1 +
>  5 files changed, 74 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index caaa402637..5d8a8836da 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -645,6 +645,7 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PCI
>      INIT_LIST_HEAD(&d->pdev_list);
> +    rwlock_init(&d->pci_lock);
>  #endif
>  
>      /* All error paths can depend on the above setup. */
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 94e3775506..e2f2e2e950 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -476,8 +476,13 @@ static int cf_check reassign_device(
>  
>      if ( devfn == pdev->devfn && pdev->domain != target )
>      {
> -        list_move(&pdev->domain_list, &target->pdev_list);
> -        pdev->domain = target;

You seem to have inadvertently dropped the above line? (and so devices
would keep the previous pdev->domain value)

> +        write_lock(&pdev->domain->pci_lock);
> +        list_del(&pdev->domain_list);
> +        write_unlock(&pdev->domain->pci_lock);
> +
> +        write_lock(&target->pci_lock);
> +        list_add(&pdev->domain_list, &target->pdev_list);
> +        write_unlock(&target->pci_lock);
>      }
>  
>      /*
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 95846e84f2..5b4632ead2 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -454,7 +454,9 @@ static void __init _pci_hide_device(struct pci_dev *pdev)
>      if ( pdev->domain )
>          return;
>      pdev->domain = dom_xen;
> +    write_lock(&dom_xen->pci_lock);
>      list_add(&pdev->domain_list, &dom_xen->pdev_list);
> +    write_unlock(&dom_xen->pci_lock);
>  }
>  
>  int __init pci_hide_device(unsigned int seg, unsigned int bus,
> @@ -747,6 +749,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      ret = 0;
>      if ( !pdev->domain )
>      {
> +        write_lock(&hardware_domain->pci_lock);
>          pdev->domain = hardware_domain;
>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>  
> @@ -760,6 +763,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>              list_del(&pdev->domain_list);
>              pdev->domain = NULL;
> +            write_unlock(&hardware_domain->pci_lock);

Strictly speaking, this could move one line earlier, as accesses to
pdev->domain are not protected by the d->pci_lock?  Same in other
instances (above and below), as you seem to introduce a pattern to
perform accesses to pdev->domain with the rwlock taken.

>              goto out;
>          }
>          ret = iommu_add_device(pdev);
> @@ -768,8 +772,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              vpci_remove_device(pdev);
>              list_del(&pdev->domain_list);
>              pdev->domain = NULL;
> +            write_unlock(&hardware_domain->pci_lock);
>              goto out;
>          }
> +        write_unlock(&hardware_domain->pci_lock);
>      }
>      else
>          iommu_enable_device(pdev);
> @@ -812,11 +818,13 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            write_lock(&pdev->domain->pci_lock);
>              vpci_remove_device(pdev);
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
>                  list_del(&pdev->domain_list);
> +            write_unlock(&pdev->domain->pci_lock);

Here you seem to protect more than strictly required, I would think
only the list_del() would need to be done holding the rwlock?

>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;
> @@ -887,26 +895,62 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>  int pci_release_devices(struct domain *d)
>  {
> -    struct pci_dev *pdev, *tmp;
> -    u8 bus, devfn;
> -    int ret;
> +    int combined_ret;
> +    LIST_HEAD(failed_pdevs);
>  
>      pcidevs_lock();
> -    ret = arch_pci_clean_pirqs(d);
> -    if ( ret )
> +    write_lock(&d->pci_lock);
> +    combined_ret = arch_pci_clean_pirqs(d);

Why do you need the per-domain rwlock for arch_pci_clean_pirqs()?
That function doesn't modify the per-domain pdev list.

> +    if ( combined_ret )
>      {
>          pcidevs_unlock();
> -        return ret;
> +        write_unlock(&d->pci_lock);
> +        return combined_ret;

Ideally we would like to keep the same order on unlock, so the rwlock
should be released before the pcidevs lock (unless there's a reason
not to).

>      }
> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
> +
> +    while ( !list_empty(&d->pdev_list) )
>      {
> -        bus = pdev->bus;
> -        devfn = pdev->devfn;
> -        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
> +        struct pci_dev *pdev = list_first_entry(&d->pdev_list,
> +                                                struct pci_dev,
> +                                                domain_list);
> +        uint16_t seg = pdev->seg;
> +        uint8_t bus = pdev->bus;
> +        uint8_t devfn = pdev->devfn;
> +        int ret;
> +
> +        write_unlock(&d->pci_lock);
> +        ret = deassign_device(d, seg, bus, devfn);
> +        write_lock(&d->pci_lock);
> +        if ( ret )
> +        {
> +            bool still_present = false;
> +            const struct pci_dev *tmp;
> +
> +            /*
> +             * We need to check if deassign_device() left our pdev in
> +             * domain's list. As we dropped the lock, we can't be sure
> +             * that list wasn't permutated in some random way, so we
> +             * need to traverse the whole list.
> +             */
> +            for_each_pdev ( d, tmp )
> +            {
> +                if ( tmp == pdev )
> +                {
> +                    still_present = true;
> +                    break;
> +                }
> +            }
> +            if ( still_present )
> +                list_move(&pdev->domain_list, &failed_pdevs);

You can get rid of the still_present variable, and just do:

for_each_pdev ( d, tmp )
    if ( tmp == pdev )
    {
        list_move(&pdev->domain_list, &failed_pdevs);
	break;
    }


> +            combined_ret = combined_ret?:ret;

Nit: missing spaces around the ternary operator.

Thanks, Roger.

