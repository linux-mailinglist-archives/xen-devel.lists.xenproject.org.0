Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860C2EF618
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 17:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63726.113090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxv4Q-0006ea-Hm; Fri, 08 Jan 2021 16:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63726.113090; Fri, 08 Jan 2021 16:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxv4Q-0006eA-Eh; Fri, 08 Jan 2021 16:57:02 +0000
Received: by outflank-mailman (input) for mailman id 63726;
 Fri, 08 Jan 2021 16:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxv4O-0006e3-60
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 16:57:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3f24391-476d-4a35-a9f9-a660e37841f0;
 Fri, 08 Jan 2021 16:56:59 +0000 (UTC)
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
X-Inumbo-ID: e3f24391-476d-4a35-a9f9-a660e37841f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610125019;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/Zq2J16XmRVherecIwnro6tXbXShXc18siuadPom+HA=;
  b=HDRI1iyqsqhgLDlUrLe8+oK+BdiJJ/agsHDpTip3SqES6UZY4PBDn4ic
   rNNV+0x0jJelKHNjLKpGHUfpmRnriIPJzIMq7waMVy6/LIX0xH2CGLn0O
   gT2/Ny3nYI7P9vbQr6mxZudAXVWceMkqBKhUDOFP51atfxCvXT7XsG6GD
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HWiQDtfFAGtp77i9NEu0AkiUUYrwHZ44PHaBImSKS6ziT6JyWMMOG42Z1qRf7TtH7mtSiPgdCt
 W33LO1nZVl88lWgChHtVtGbnYHDzx2rAf9gCZitffBDlwIatr18CyDp8X3DZgoAI+2NRpKEimy
 BRnyqGLUVRgWKqfOEyYUcJhCeTzr4UCdNgs1tlwG94CLh9MdSe2vTMaGCrsmJRKeZWXcvAxk7W
 fpkwCV/9Z16+8DriSgP2p525YNinMJacsnQO2ORzkZfE+tTd977Ump5vQ9WooCBw8GWGibvf5m
 5mY=
X-SBRS: 5.2
X-MesageID: 35990007
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="35990007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8Bl006orONpYc0uAtiOAmT2zRzd0puHPwHBmUKM64xNojan0LDTvfg/73KoK8JnSCLF3IIV75nuADYOBLRtC+/KxIJZoTIZnUcvAcQ1nZTak6DojK3pI09hy7lXNGN4VGdj6oUcJKgfvwBSR569W+OQtKZF2Aguysm0PwR1b2QmEm9ThS9eHXhIxdm0HV4eb2emzHALhgZaPLlD91MnGfbH7KGYuZRHaO+bq2n/pcaFQBPBMclzgPAu8EwHICjOQg9p4IImkFDKRoU65QohJlSb+u3xSx7TLkgS4O+GSyjY/8C5fDTS2jgDFgDTI3ZCQqld2IcZZOOX1PHHjP5Wnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K96Gzt05k7XvDEEfZnEeSi9cQct+fhQoRyXwlTC0cs8=;
 b=RriPik58IJ/5vVdg+d0okeUJvhYZEDXnutwNLEcqLfNbRkSlNaV6HpFLFuaDbhL+aUE4J5WyzXlqNZ3jTQkkQtPRtac5azFqPFciKi2pE6nwtwWuZy/cZhjWDdpYTyAEzfsNsJ9hQXhPR1o2argh+0+2DPSFXLgePz0ongJ8Ft3UOC8WpaniyEuM/iYpEEEFUPt50aVoTEkxpI7+ajSDbWFOs/l6wjdiGGDBushQqAS7GJCxpc8LSuNgWdWGXqN/2vme+TcPfe6ONj9SRQl7ZgEZRgimseA2MGo569krleZbwFv0TJ6xCe3uB6Gmq0pIjoJV5iicogkUAWqrtvcPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K96Gzt05k7XvDEEfZnEeSi9cQct+fhQoRyXwlTC0cs8=;
 b=YWYNaMkG/rTXVgK3JX+3yHtzuWyzuLjvlvUR7fAOxhIqOPDh4FsjowqB3JCcOsltJLoEBqp+iM27k6OYE5UmEHinLEijY+rEi/q3tvS1PM6Cmw331yakDuW/+kklbL91ouGr9ynb/xj9xHrSJ+cVOrPKguLRkV4KgQ+XNUAXd08=
Date: Fri, 8 Jan 2021 17:56:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH 1/5] x86/PV: consistently inline {,un}adjust_guest_l<N>e()
Message-ID: <20210108165640.e2ztg7tchilug3gb@Air-de-Roger>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <686d7f09-6313-6dd0-2133-8646308aea5b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <686d7f09-6313-6dd0-2133-8646308aea5b@suse.com>
X-ClientProxiedBy: PR3P189CA0068.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5280925-1bb2-4a7d-efeb-08d8b3f66211
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42187C6FA52A0ACADF3580A78FAE0@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEzqO9BERkcOzJciGGLGNcpRaaBQ2H7DG7QvbbXW7EzMZt8G452kKd9myluOZKugQIh6BFlAC6ju/eKywiRoNSnAxu+QsVT92VyUdQPC79YWbC1bMy+tu320vaAkdibt/2zODvkLOBEZKwejtEYvEHOkqlhvYgXL02R7ANC64YwuPctMeHQypnFp/XG/xCbsWSbvNnPmjZWHydYV3GQ0Vk1B9SOQROjmnvSfjA8h5u4HusfxOq2VLOJUBkmvGjA/9z4UjjcjAOwxaKFaScvRcRRaVgNUXT2NwMsy7RIF7aApJyu9Z6T/7KlAzKdlFBr6lPmUZAGCUTcThjJO0mM7jzjnydkRacMJn1Lff5n9h13CxPs47GuGQxdfZuLgsTfCU+tHomk2FSleVyxF1Nb4+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(86362001)(186003)(6916009)(66556008)(2906002)(5660300002)(85182001)(9686003)(33716001)(26005)(956004)(16526019)(478600001)(4326008)(66476007)(6666004)(316002)(8676002)(107886003)(54906003)(6496006)(8936002)(66946007)(1076003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QW1MeWJOMzFKYno4eVhud0hKNkUwV1plR1N0YVdKRUlOVHdjWENsaklMdW95?=
 =?utf-8?B?QmdXeVllVDI3Z1Rtd0tNYjQzSWg0N2hKQzhKeEUyanZNV1RrQk1GbitraFRP?=
 =?utf-8?B?dXdwYnJ0ZFFYWlFnL0I1MGh5N0Z0TW0zSTJGQ3hIVTBpV1VHWGdGMTE4R0xu?=
 =?utf-8?B?bTF1cEgxSEZzNzNySTF5dFBzVzN4RlduaW9wbndHOExvNW52SDhzUjFRVy92?=
 =?utf-8?B?aHNLS3FtanZUQ0p1NFRYaGRLWkRXWlI0dXZpRU04dUlzY1UxWERHMWxWSjYx?=
 =?utf-8?B?ZXpmMUJoRWxZOW1BelJOWmNtT1BuYVVaOVN5d2dyQTBLQWRiQ0FvRXpBeERX?=
 =?utf-8?B?aEY0RUMrM0swUHNiUEtFNFpGQWUvcVVnaTZnSDdaOEVjT1FIWnFNV3ZvOUdv?=
 =?utf-8?B?UGhkeWZQa0NEdGhJY29IVjI1WkZlUnBsTHJWaC80ZXdWeEtlR0dlTVpFY1A4?=
 =?utf-8?B?bFBXVWZiOWNlVEZ4NFRWdGxnRXIvV3ZDNEcwL0x5clBmcmMwQzlDcEF5QzVn?=
 =?utf-8?B?T0paYXBIWWVaL3FtN1NWL2s5VCs0YWM4N3VxeFI1ZERrdWhnN2V4cHlmZWtn?=
 =?utf-8?B?NGNZd3pncnFGR3J2c1U1TVlIVnpkUHU5bWtWckVLQmRoc2dhSkFhNXh4c2t2?=
 =?utf-8?B?aUtKUUs3WWkxY3dQUXErUkNlS2p5dVVsT1BOcjVPM1NXVXcrUjgzSFIyUlhN?=
 =?utf-8?B?ZS9GNWlxTVdYMFVUUmVuN0FtQ3VJVlNVZlByYXVXZGQ0RDI3VXo1cHZnaEZD?=
 =?utf-8?B?RGh4SnQ2U3FCaTFBOTJMOU5wTHFiQklTR1JkdXRWbEU1SEU4emtqZzNiTU4r?=
 =?utf-8?B?QjN2UTduQi8xN3Q4eEJyZEkzcWFhbTVYLzBWbFgySTNNY2JydS96cmJYbVFW?=
 =?utf-8?B?NFlCUTVlTzk3S0kxU3BYVVVPNE03TDlyc2VhOHRrK2NpVmt3YWFIdWR3MEtx?=
 =?utf-8?B?UWJiZ2dJeEpUNFowVk1ZR3JndDVLNU14YXZBSW95QWw5cjJGQUNmaE1RaFdE?=
 =?utf-8?B?NmYzNWRaM2s2SHo5U05Hd2UxT3ZFbmpvajM2T0hjTCtoVkV0bzIyTk5MeFZa?=
 =?utf-8?B?K2pCVmFkTGpiSXVNcHFzdnN2QVVKRk8yQk1oZHJiaVgzZnhvMmlMQVFqTnBX?=
 =?utf-8?B?UUJiWTl2SnpNa08xVmlQLzZ5OUovYjdPckYzOUcyL1BsNnI1SEh3ak5QMTNa?=
 =?utf-8?B?YjZiWFpXcXdMTmpKTlN3ZVI4ZkovU0VUeUFqNERpZEtDR1crYmpRZ1E3c3VO?=
 =?utf-8?B?SDh4TXd5eGQyU2lUZlk0d3gwUzlPakFCUE1YZHVidHN2Z3Faa3JzcUtrOFU2?=
 =?utf-8?Q?ltnhnm9GeWf4Mmfdy2Iii3D4vv3N3eFC9H?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:56:46.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b5280925-1bb2-4a7d-efeb-08d8b3f66211
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fviz4BRe5LwwVjah0G6A2qePwgF7sy307ThuFCuSl0JMs2cbPZZQ8bK9LnavK+hlSScZqrTPaCED1ItobEOiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

On Tue, Nov 03, 2020 at 11:56:16AM +0100, Jan Beulich wrote:
> Commit 8a74707a7c ("x86/nospec: Use always_inline to fix code gen for
> evaluate_nospec") converted inline to always_inline for
> adjust_guest_l[134]e(), but left adjust_guest_l2e() and
> unadjust_guest_l3e() alone without saying why these two would differ in
> the needed / wanted treatment. Adjust these two as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I'm also unsure why those where left without always_inline. Maybe it's
because for the way they are used?

Turning them into always_inline shouldn't do any damage, so I think
it's fine.

Thanks, Roger.

