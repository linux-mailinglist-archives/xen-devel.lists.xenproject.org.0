Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA86B71BB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509173.784474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdxy-00042N-1e; Mon, 13 Mar 2023 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509173.784474; Mon, 13 Mar 2023 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdxx-00040e-TL; Mon, 13 Mar 2023 08:55:37 +0000
Received: by outflank-mailman (input) for mailman id 509173;
 Mon, 13 Mar 2023 08:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LnkN=7F=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbdxw-00040W-Jh
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:55:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0632441-c17c-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:55:34 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Mon, 13 Mar 2023 08:55:30 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.022; Mon, 13 Mar 2023
 08:55:30 +0000
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
X-Inumbo-ID: d0632441-c17c-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdKHhOivOZ/P5PHM22t3YFh3nPDmzeRX0aAn1giEGUSozOickO+5HQnQYSzMC/S3NkJhXzEbqCB7lMlkLqMDj+IOvLPW+38qSbbfaJ2k+t9XywwZAc7fWkP0jU/CFPPkPB2T4YEJvNA348AQq6ErHOLgNCliXVjwwLOe34Q6MpuTLMD8wmA6xtm5oBG4gMjx8XP30VnkjVHxJsudwZkKkSQDFOERHzHWSrWWN+DmIDjO357fuAIF7cGaNEHVnfz49uuij0L6hann3B3E2hRLVF3FKHnv0CyMQC1BFcuPg2lEeGW/hstH+f11gcIXu1c2bVEeAVPbM2ZAWbppRHfN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+PExcv0EutWr4XZN0JdtyuBhcCY2NsQB8QJGRL96/k=;
 b=fhLeeg7csr5mjvGxpbtLhIEN5NXq8F3oZUlRKy1jq3ex+uLPsX6p3miVSgbWzi2sDrUFKwRJEADU/yIaeeWm9xF+St54BY8VW3StQDnItIHo39dHIureBUjvpdONoj6MD5e0VjzX9A2iW4GQvtgXPdZit38hz0MPzw/L4dKrUi4Na5VR4sZpxCbA2jZ9jnPZ8lcrYzFabbwkcWf0qzJP9uEHUx2mcvbb34Op06WhebVoNwAAWB6Z1cCdbIPbD12A70lYoaUqBUD3RFQ8zx4q4suaF9clCNrXRx++V8EwPV6ivJ1Fv0XyumTceN81KuERInuIFTSD8yWokE2l227cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+PExcv0EutWr4XZN0JdtyuBhcCY2NsQB8QJGRL96/k=;
 b=KIZleRjYdZ4MR3uTS5oePxeoHQ5p+YxNJQc2TxyL/Z9KZJzf7PxWV4dCVaRfcM+SyNUMqZfyCOcSjfBaubhnMURtQ59OTYdYCpX/s4irmIwTLVVR7areBwxC0b9H5wQ+1ALubseYbzi1nJwAEf3CG7Dba5WzH3xzIHDc2DEtEHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 13 Mar 2023 16:55:05 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Message-ID: <ZA7k6WQihXntDdYA@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <d0fb38b8-455e-1210-0f26-9ee7c4335e69@amd.com>
 <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e292ea24-606f-24c7-ee44-34d55f7147f9@amd.com>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cf49a8-900c-47c0-a991-08db23a0b28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n405SwiMk9t0oDAnbHM0iM3xXQyYJjAgr6xACbSlqOuZZZ8FWMgOUT6n5a4l3aPfqUzLKA0fpqsRIgcgLSWwbO0c9m2CmQyvpufjuwfFLFJY6SGnYzdq3OW3pFY+qa/MsszYl+Xp0O67hm/Yl+QF6l9Us5W3CgFWkvIqpTGdmnEnNNY2m+j4X87WGZRMvaPxhhTb6iaJgWehx017E0Irl1NwP4iwQ2uzzD2HJeLH8zs8J9ODnd6ybDksxOkoYN12sfOyzWv2JRPWFFSDpanYiRrumeUZdQbPCh2nfozddj6dnzo+EI1JdavtZdVMbcVSe7xAq5PNHctkteCwIz2tSXxVUPHnPjGsZWh5R3vvhJ6Rmqc8evFGbwr9ylkTXcr/t9do1G31WkKfjzJq6vWbTkvzgJ65vaZ0zc79urSyg97bVjxNDBhKqqy8zOLPMgti59zRsxiBShGBUcrYVd5gw+kFRgAf/SYUIl4K4Rxe4l1/Ga8N/0YF8vZ9Z1x/RYJFFsdk9lsAyBaOQMOHUUCwm1zdHfE33NbN5E+GItQ3roaSOHn2s6ryECGTv+e6i2Dwq7q3bAQZ4GKJVpSoamtM20RiCjqi6I7fWPXXLko4+OQ/+21rQ6zar7q37duggqTYmyOfeCVPNjNrwR6njG6WmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199018)(2906002)(83380400001)(5660300002)(36756003)(66476007)(8676002)(66556008)(41300700001)(66946007)(186003)(6862004)(8936002)(4326008)(86362001)(38100700002)(316002)(6636002)(37006003)(54906003)(478600001)(66574015)(2616005)(26005)(6666004)(6506007)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ronZdEUU1tQmV1iM/clU0w0MUb00NbshVf8t3loUeDACRVommwmF5g4Pxj?=
 =?iso-8859-1?Q?8RhOfG3dLkdZ1gGikMT5/hKRhZAOCo+uh6YZB8yqVmegJkD4CPT16qd2x0?=
 =?iso-8859-1?Q?RsPf+fpvMoRQ5tl2BahLK4QuHTesi78NJl7KdNc++70Z3d6gOa+KfSGaXk?=
 =?iso-8859-1?Q?ji44CKIojUB5+a6SwYIsdUs0+70DhbOMdj2AloTDk51GXlZ6Y8QdfugT68?=
 =?iso-8859-1?Q?YGYV9tuq6BD7s8E8f7iQdqZo8/zzWwS5kX9MiStOvk6jcE+DH2KWo7zmdI?=
 =?iso-8859-1?Q?59CLGDP68tFJjC1V5fA0a51WnbW3FkDPqV7c2knAXjMljSyDqk0HSCRvVO?=
 =?iso-8859-1?Q?4kqIUIkg6nyprtl9Csck2RbqDzQTjWqP5LD7hGh1huNouRSgj48ahVifSo?=
 =?iso-8859-1?Q?H7HLeNDB5jsDUuLzvE37XGkAfqzDf0tzmjrXNG1A8c1D0IsgkE+SPHeyc/?=
 =?iso-8859-1?Q?falPT8qncFSDG9jLsynyas4CAd5L64/BNenDB6zRwcdoR0b21Tyrjj6DbH?=
 =?iso-8859-1?Q?8y3xNJdJRnmtdKTMC/ABpFZX52inWUDeP76ojJNfVbIrIVCJxjwjnujVmA?=
 =?iso-8859-1?Q?wtBVyy4DK16BAxv+Hqtkyghmao7rkWqt7TDf+fRSnIfFwLfZHtihie4OPk?=
 =?iso-8859-1?Q?/J0s9ObLRJ5dC51izijvAUTmYjooNbVbE2/zgL99AHufSDVwTX2POluys4?=
 =?iso-8859-1?Q?QWpSWbqOhSqbOTeNpIoqFqrAN9aObco1o5rXW5U1gcoOl6ws9M8ec/MbHW?=
 =?iso-8859-1?Q?K6eM4npwVZXmD8l30trQDHIa3uToF/054oCDI8nQs+zdf4Dzyvq9Mmtayl?=
 =?iso-8859-1?Q?P9S3OtfoFjb8l+/LgpRQ5bo9wFJRXAxkifzYVYlBOVyeyLIL2IqTmpIB0w?=
 =?iso-8859-1?Q?LxIghQHAPgW/+T5rlWAn4y8TFU4QVcidZsC7UnAu3HbCo7vR9wUzlz2yC/?=
 =?iso-8859-1?Q?XEXWnoJ002fYPJ0B6+ICIq4wm9i5ht2cbcIDFrWej+pMqQb/T1W506aN99?=
 =?iso-8859-1?Q?jsfxR6su1GZv9KAK961XGR7FEMEcEnd2WlnuZ5F+KjZCSGPD+YaVScr+si?=
 =?iso-8859-1?Q?rcZBtow4+09GRUNyhRUfaJN7st8chexFtlGp1Xx8Ii0//mDkwmNDkh/qMO?=
 =?iso-8859-1?Q?oGcYALhXX5Zy4ikwuRSFDdiNujd/kImvMok3yNgaQ5/+0GfzYH9HiLhIAF?=
 =?iso-8859-1?Q?lP1LYjSQrQYbrMwy/BvMuhfmHxHd5nLI6r1tQOGPJ3UPCJp6S8g6YPMS09?=
 =?iso-8859-1?Q?Pza2fozeCq9nShG5smdfq19Hc5UTJzk5QR+ibxnmtEC21QMX8RGrMaQ28l?=
 =?iso-8859-1?Q?XNXFLmkzc5s7MSWONuKEJkaZAsZLJxoQeF2jNKAX3Zypf4O0OJYs9mlBUn?=
 =?iso-8859-1?Q?hvuHLu1MzcSu2H3tNwB9ayjzfkkMOW0NEoC+QCnt3ILqHHAFtQ97hD56qN?=
 =?iso-8859-1?Q?gHGMBmtnqKtovtawHORyIdLByRdKVlFbljcP3XoaAx545SyvILKjyXOUl6?=
 =?iso-8859-1?Q?J1YTBzQmjvZNictxrhDKZ1pbz+8ZbFl9iwivdhV0d7r84mAqwyzyAbviFH?=
 =?iso-8859-1?Q?wAD6yCOXe4sxE7URDKIXMDMkD4qV1zQrpEuU8drFcwssFkHHafs362odiH?=
 =?iso-8859-1?Q?LvcEkRjxTzvLQzRRXLC4oIbF6SRAj/lsHO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cf49a8-900c-47c0-a991-08db23a0b28d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 08:55:30.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5aLzA5ckD8QW/3+/bU/mISoEe9h10yiEr7RhEmnhzXl1GR+tllo9kNhz+nxz2GGfRo3bA/i41yMvjVXPs9jBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

On Mon, Mar 13, 2023 at 03:26:09PM +0800, Koenig, Christian wrote:
> Am 13.03.23 um 08:23 schrieb Christian König:
> >
> >
> > Am 12.03.23 um 08:54 schrieb Huang Rui:
> >> From: Chen Jiqian <Jiqian.Chen@amd.com>
> >>
> >> When dom0 is PVH and we want to passthrough gpu to guest,
> >> we should allow BAR writes even through BAR is mapped. If
> >> not, the value of BARs are not initialized when guest firstly
> >> start.
> >>
> >> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> ---
> >>   xen/drivers/vpci/header.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index ec2e978a4e..918d11fbce 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -392,7 +392,7 @@ static void cf_check bar_write(
> >>        * Xen only cares whether the BAR is mapped into the p2m, so 
> >> allow BAR
> >>        * writes as long as the BAR is not mapped into the p2m.
> >>        */
> >> -    if ( bar->enabled )
> >> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & 
> >> PCI_COMMAND_MEMORY )
> >
> > Checkpath.pl gives here:
> >
> > ERROR: space prohibited after that open parenthesis '('
> > #115: FILE: xen/drivers/vpci/header.c:395:
> > +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> 
> But I should probably mention that I'm not 100% sure if this code base 
> uses kernel coding style!
> 

I noticed that actully Xen's coding style was different with Linux kernel.

Thanks,
Ray

