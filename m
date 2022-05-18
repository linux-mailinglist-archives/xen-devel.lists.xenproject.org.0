Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B585352B597
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331776.555351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFgZ-0007hg-3U; Wed, 18 May 2022 09:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331776.555351; Wed, 18 May 2022 09:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrFgZ-0007f8-00; Wed, 18 May 2022 09:09:39 +0000
Received: by outflank-mailman (input) for mailman id 331776;
 Wed, 18 May 2022 09:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrFgX-0007ey-Ju
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:09:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d482888-d68a-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 11:09:36 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-eumYAFjxMH-00Oj0Yd_mnQ-2; Wed, 18 May 2022 11:09:33 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9091.eurprd04.prod.outlook.com (2603:10a6:102:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 18 May
 2022 09:09:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:09:31 +0000
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
X-Inumbo-ID: 3d482888-d68a-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652864976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FB9f0WhqnceNrPFuwC8L4UdZx9UdQr4LPEJl3+KCLcM=;
	b=XHIGmZxF25jcwMYJEHkol1LyFra+c5Q269StbdKq9IaANXTnPNYs0u69qtynrS0/h8uNWV
	H8dyoXGXLPBBoaBILn7bg+XD/0fkGM7Coul1PqmRN6rWnP4nMSEZdHZy4MC3llwOewc+st
	dS/0fEEK1BGCd5KCxrlby6LgYzJ3oa4=
X-MC-Unique: eumYAFjxMH-00Oj0Yd_mnQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ata4159CSmWLSQGEDITJsdZgeVOkT+NfJw5N2LTLyFf9klnwXfT5cAxytCk762cTThWuevKMZmSJM/x3e86rkUx2GTGOj1xW8Z033b0AA55UAI6t+AO5RPwxK2X3eVSGgglzJha5bylDf6PJGNr1PHmaAZsJ0NJqVg6awiP0z9YpIZQZLZqv9mNj51PbYINHX5rx5PnVOOdIREL53vBUqLxcQaPe3JadUb4ai09sXljoRnFrH6vIhWNjay8wYrHADsuAlYgEeaxLwvkkRamBWRQhyhGg3tVmDd3E12hYS4QnsLYt6bU0QwdV7fF7sBuQSUSR/gHABXauaLLfwiGZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9Y17SRlcm1fE43VCjzb+soUeKe5kX3r0qi0eDJF/jU=;
 b=mKdWzqdOxQWORg1K4VD+WS7PyGj5iivuWQGi7B2aQ/M1YYjo/2xeaRuMK5p2lZ9ZAPRygIpbTyr+xBZhXoNrHvgoXrFnMDKnZ7DzNuqrXhsfYMhnN/26UYhaXlY1MJ8pP+Sb+5sfiSzjAXvTh/Q+MRdTdFrNCSlwlAHkEvkyzaioOWSZzRTg1PRVfK/VPPUIFU+7/LfLa9naU4XNuNYY6X/l7STksqvuRqrghh60uO/Kpzk0DPBSMIX3hvq8kDfO6Ed1KO5yy6T2QlBXnNmG6XfcqDiqevGjP3TwHijNFFhCpKNFo/s1Nns6h30g1rddyGS++mupPG5itAFcy5bPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3db124b9-6ab7-f9e7-3c2c-13d82894bdbf@suse.com>
Date: Wed, 18 May 2022 11:09:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
 <Yn57zsIVGfM8s4Ld@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yn57zsIVGfM8s4Ld@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb60ee41-4a09-4f7c-9603-08da38ae1e6f
X-MS-TrafficTypeDiagnostic: PAXPR04MB9091:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9091B619ED8640C034A92C57B3D19@PAXPR04MB9091.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5KYIp76Eiyo0wpAfuW9cl9kg5CsoaCPy0hRdhROMdRSFpFWzByhW8vquCYEx5PN0Ei1cAXXNNA0EDNrZs++drkf19TzOPFmrDw9kMQzqqkGD4XrPjnmBE0Vt3uvSUX1llkmN8az37Zdjggep3t/lM61gMc8eyJHsjwfWG8a63L25+Fx346ylKazgZlxgFt6agIILGeyxZJU+0lQxtyW7cO2DptEErgMaC5DxZdoCfirXMwm4UAAdk7xT29sn1mupsuFjGFXMKSaNxpmbW3Ewpm04uzlIip1n3A+eB08EKQ4ZpZpEst9YibKRYBZckZINQ8u18LhlXRsX1IJXFq1lY+CVJZhrDaunfvCJoIWHhGYfFuiyVy1P1cHenwSaTLIjCKxJ2PyLPBwPVkA+Al5kToYaI7VxgyA7NwXTQLnoXPxinBRNJMBfDbctPZBPBwhrL5gtLYQbaFhOaRq4T/xc3GZWXFtoOY0jW3/IuTXfsqDSTTH9BiSfgdyw00zr2kZtcuR/Yz0vUENv1/hggYwwFagMKd5UiKMDyoDJqOhfKzkzCHb3tcB1HG7WeUQrl4OYux/uiYS7cJsNWDKZ2XzIaLDXd56I3Z0/Xn4oDHGVxzu4Rkm68bdviBq8Lb5FhjRRVNyvu633F5y2h5pV0Dbk/hHUZpiN8XvShPq6miOXEOApp9JHC/hnjWvqsNffJ96KdXRJjwzWOC2qA8VpHkTUlKSwmsFy0IGjvpM9ss61V94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6486002)(2906002)(4744005)(6512007)(2616005)(26005)(36756003)(8676002)(4326008)(110136005)(8936002)(38100700002)(5660300002)(31696002)(508600001)(86362001)(31686004)(66946007)(66476007)(66556008)(54906003)(6506007)(316002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1JZgVfTfou9/lyHvhQKieL2Xl5JhKpziCE+TylmyK95/fkzxGIFmKJearbFt?=
 =?us-ascii?Q?cIRRDwzMOAauwtTQZ+xHS0YX4rxJIRLH1Mty1tR9kyQ+xM3hlkS1dNMvH8zN?=
 =?us-ascii?Q?lCQWlkvEwdQvb35FidygO39cl9ng3W7evAGv590AX4eMYqMMGCbxs8wcYKAb?=
 =?us-ascii?Q?lIhW1qDqSZkSjKB1x7UFrFhdCynWblLb06hFsV4vg1KFoisDN2iv7u1L5DKw?=
 =?us-ascii?Q?ftwHgkjqcr2aGrbuGvHxV4f8puvZ8Xkhs87J3Y6DdvDygnZtiltrq4U61G9C?=
 =?us-ascii?Q?FT894rkRkmmCG7Izqpf3Vu699VohQ+i3snM/RU4hFtgXx9/43IYOkd1LzHR6?=
 =?us-ascii?Q?h70rma9ptEHkbz4mK9pQs3RdghE9ritKQ8j9nkwzIZZ/bZmdTfdfL1vAKK7C?=
 =?us-ascii?Q?cSudD4MLYq6vh6eSrPo3JF7ADx++CufEFQ8o9O+1Y0qbIZdIODY0UgYiW6+p?=
 =?us-ascii?Q?2BGTnNQQYHKol+htg8iW/IruNNQXHPIapUzq+K07o2kyW1iL8NPcovkvrmEv?=
 =?us-ascii?Q?EMv9PyYLAoqbOTWRGa/mYptwebif0dQTskGoYEyZJ2IkPT8MGjtALuCfsmON?=
 =?us-ascii?Q?Ypq2HY+fBQzimaMHoZ/y6BA+9KTk+lpRLDdcmQYjeZ0l/Im+ylLwZjKEn9nz?=
 =?us-ascii?Q?X3XgJ0A670dpe0BpSUeh9zNYv+l2jxegjRqMY3HUA4+TdhgBPwkCOuPwZj0/?=
 =?us-ascii?Q?FM+fWKJkNgI9l4doDECPibCqid8bjQx+HzGWw+2AqKaFUUUGEDxf7Av1+uY6?=
 =?us-ascii?Q?iya8GUvcss8n8yLO+39iL33W9B2Pf6wLSAGzGO4OdTEmFQOZVEhbcMG8I7EP?=
 =?us-ascii?Q?WpMfuBuMXSViNB2n9OYU9minzN6LiIczl1NNJ/uISXyyHV86QdcH1vOCgLtd?=
 =?us-ascii?Q?ZtPdJYZyC+SZLiCgdqVUb6KpqZErT5STKrdaAnn3i7QXLSNc+QHeh8NHblGg?=
 =?us-ascii?Q?ybgKbdhH7zrTG9YtqrY/F4UUNn++D+iSEER0vPMmMNqyawK4GKkqD+lXgoW7?=
 =?us-ascii?Q?8ebau5UvJcijbMx2hW0pW/wkgz5moub8/KAissu93rdvTLQiIFwACT3nJooN?=
 =?us-ascii?Q?TIIEDTEfXKSY/QKhOXely+nzvBVodEJrtSvsYzdksSuoqJ/RbwrzvVcPvWQZ?=
 =?us-ascii?Q?6OT7plb1fx5RS3hXYGNLqGfggk2VhCUTpGcUK9sGBzTZFbo0L4ztRQXMkZSu?=
 =?us-ascii?Q?V1hgzQOQzZHOdO0CjOnR5ClZ1vZBmGcEc6pFbV96i6yCxqHVaMMPQLo5jUL6?=
 =?us-ascii?Q?d7mYsaNrv6PXyRoPfWvUSxv8A6o4d6vVk1lR7Tv+yerVLBOcxF9YM647JeMn?=
 =?us-ascii?Q?PlLyiAhfMfmvb4QzpW+RYSAUHQMejV3TucfAKc8VdSs0Na8WkJA+49nd0Fdd?=
 =?us-ascii?Q?jB6ki+XLaQYbafkllHtBjZvtKA8mh88K4++H9SdO+H7eQieROjFRR9Q3BWrR?=
 =?us-ascii?Q?AKk3RjFiLXKqbr4AWDt38Qeva5tPwRTXvn/XCwoAQrefA1HI6vT0+v5iEjv9?=
 =?us-ascii?Q?oFJ6geXiIQnpGQQTiE394/9s3MSQxB2rRiEKgok79ZpI7VDxD5wKnZFrkqRr?=
 =?us-ascii?Q?yjZqJDImzGKWXeaBxiCTVbfguleG3QFWHVgCKXIjIf+YeglheNbmFng6IV3W?=
 =?us-ascii?Q?9AaawxTpmg5vWqG4osPOuG2C+YkyIgUbvCPhfa3TFgjMJHdz+NbnBMSpBRd4?=
 =?us-ascii?Q?wOisTL7V6mtbt8Dln0gpzGCezdWJal5jU/8SfKo1Wn0bNuq+qsNsWnPai4wH?=
 =?us-ascii?Q?RlbNy2Fcow=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb60ee41-4a09-4f7c-9603-08da38ae1e6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:09:31.3690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mm0NieMskMF3efX1ZbkWJycfWB1NYLyJINObu9cOoi71UqpQY0kc9zTbAxlwZj/rjTB0XVh84fvcJ9aWtgt/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9091

On 13.05.2022 17:39, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 11, 2022 at 04:14:23PM +0100, Jane Malalane wrote:
>> Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
>> evtchn delivery set up on a per-vCPU basis via
>> HVMOP_set_evtchn_upcall_vector.
>>
>> is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
>> physical IRQ to event channel mappings.
>=20
> I would add something like:
>=20
> The naming of the CPUID bit is a bit generic about upcall support
> being available.  That's done so that the define name doesn't get
> overly long like XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some
> such.

On top of this at least half a sentence wants saying on why a new
CPUID bit is introduced in the first place. This doesn't derive in
any way from title or description. It would be only then when it
is additionally explained why the name was chosen like this.

Jan


