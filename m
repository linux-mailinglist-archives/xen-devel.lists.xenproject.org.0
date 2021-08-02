Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06F3DDB42
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 16:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163125.298899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAZ7f-0005lY-0a; Mon, 02 Aug 2021 14:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163125.298899; Mon, 02 Aug 2021 14:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAZ7e-0005ij-Ta; Mon, 02 Aug 2021 14:40:54 +0000
Received: by outflank-mailman (input) for mailman id 163125;
 Mon, 02 Aug 2021 14:40:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWm4=MZ=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1mAZ7d-0005id-Pw
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 14:40:53 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3210d76-f39f-11eb-9a55-12813bfff9fa;
 Mon, 02 Aug 2021 14:40:52 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172EL4Fa026176; Mon, 2 Aug 2021 14:40:51 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a6cntgwmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Aug 2021 14:40:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 172EJvWv102358;
 Mon, 2 Aug 2021 14:40:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by aserp3020.oracle.com with ESMTP id 3a4xb50d1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Aug 2021 14:40:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4754.namprd10.prod.outlook.com
 (2603:10b6:303:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Mon, 2 Aug
 2021 14:40:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 14:40:48 +0000
Received: from kili (102.222.70.252) by ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 14:40:45 +0000
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
X-Inumbo-ID: a3210d76-f39f-11eb-9a55-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Qphtz8A3NoIyavcslI+pslFiaFXGek/XRrvVCEJAXLM=;
 b=BQZkGG7LFjTxOo8mu5Lgb9xLhhSPaRRYHh9uTbUjC9cPx7RHi7k+fdL9pei63nbAWFg1
 gnv78nxkAgFbKJFV7rF8xylOqsCz0IT7tZzXM0YhOYyeG3uivJ0dTc3iFP/eyNXBtGZl
 xHQTpqermyT1tWemDa/RALnW17tuGnkOpUIOHt8awAX3W5OF9RCLiSK1eyWrTopnMo0/
 v7pHpK42COkVfnffewgikff0M698xK4LhNf7go9oS/xdPQUmd5Y4HE4BDCHUuMZALeS0
 lzDzMUMzbkKoBtjDioTzMdAKsAdNp6th6WJ2fNonO+rL9niqAKSjiY87fnMtDxY7BLzU Dg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=Qphtz8A3NoIyavcslI+pslFiaFXGek/XRrvVCEJAXLM=;
 b=Uits+t3KLjB8oRQ5T5/+cYL9Hp3e+OKUYdcRyNcO9BGrytGPyV6RpRlnfqb443UF3iev
 Tb0u446hnTeP7nQpw4lf4hx66oVIOoMcEMpRu3NACcEmrjFa+IJrHqBISUjTpAR9bTn/
 EPOpzyNjXVu4qW8mgaqTGB0lZvF86qiLhPIVGvgEznajM8r0OzrYXqFCXa+2fA4VBMm3
 vw9dBhXN6UanES2c4jNMnQNQuJXBYfLPftkFUavRoaWjTP/YmnxVL0esqen2fEEtrvWX
 BbByi8mEL/QYQmC2lnAOtd1NSyfm8aCkq1SPqYMPoGsc4nffcYbdJeN2YSyNK0F5/UuR IQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6mSLuk+FTH374+4REGDDZrKVtJR94qElsfEm/gzRbn+RvxifRsFvhJFv9h9vblN8as/G4hp8XsISZ+EhQqWqHQzE5dJH8o4jn3raa0XSc3oD26JiavwUpgnipwYLOJM4Mxa6ejmiJRCOtoVziLH3mOhthcO8jYbBtiowTb4HU2KPOAg5NDWsaS5sRJLmoJAD2rMjDx23xinPhG5WpnsSvN2+sK3lJ2qegk88GPnoukEW6BMgbMd74v6gzxTTP2V4kqN90SO2DPCDVqkvyxnBhWKTWfy/8fC0MpAQFwRfHMQzZeZHhgP+bGfJ730vPQecnBQQXmdF1oXUoXoiLKMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qphtz8A3NoIyavcslI+pslFiaFXGek/XRrvVCEJAXLM=;
 b=kOFK1f/+GRp0qmF+q1OlY1zVTtFpFFqTcFZbpkfxiWOVC5ULxrLpgMDXMdLZ5fWWaElR66s5HrYUsBLRKYqiYHNI4HNy9V9X+7BcijYVRkhtT8C3wtxxLUfSxOjR0Y5TaL04IbndyqTMPKi8CPKJMZZJWCIg7qfxbH4XZoAbDk1RKzSayqQtcoxvvudivolYq5tQ2RYzCYNFDieN+zdAeretQOk1Kp8wt765/Qq9GJmnWAojW/HKQhSdhKSKrtvxxP4UjwHD77v4ll5uNtVdVUoJQSBiRddSeGr/PLg3N3eNZ0ztSydpAIH7HGs79w++qgESVZHlcfcYiiGzrEpTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qphtz8A3NoIyavcslI+pslFiaFXGek/XRrvVCEJAXLM=;
 b=HV00jEml0GL3jIsjqgZBTbx//Q+9n126omv52YZ4NXIYJDP5C6MeNBwlwq72Ftr2vPKrX080IcxKHWrb+v3RkaycodcLf2bDdRtgwyv/Zkg7K731k1sLkEWvaO92WnqPahBBAWlWFJFiDSOZ4XloYU+PC7dcpqWJWUo5Zo1hA8Q=
Authentication-Results: xensource.com; dkim=none (message not signed)
 header.d=none;xensource.com; dmarc=none action=none header.from=oracle.com;
Date: Mon, 2 Aug 2021 17:40:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jeremy@xensource.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: [bug report] xen: add the Xenbus sysfs and virtual device hotplug
 driver
Message-ID: <20210802144037.GA29540@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c092619-95c6-4403-fe11-08d955c384b3
X-MS-TrafficTypeDiagnostic: CO1PR10MB4754:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB47544F4390CF2C1CD278A6A68EEF9@CO1PR10MB4754.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gd2wLEimrDPrWdd5clL6t5zWzbrw8rMjNx3CjyHJDdmjB4cTt9EvK8FAnN/wM3iztghDdvsL9zh+HKji/XhIvDNEEFTO1S6cHjgCwPwZDexnVWN7kuoRnidgfSnJu+dxtzXIsa8SHSXOxM7p+396TyqZaz+j8AZuOKGGqeBRmPinGqb2wePqJCU9VZ0v2KbWi9JlfAnLIEBl3Ij8NbJv4QbbqEBr06UR1YkCZubwz0pw9hlt7IwgtFMWmZbgCOk7e5jRnstW7xN+JEOc0fp51c/SSUXoxd8mEZ6xHuvYVNhAvxv1Iq3ICWC+l9dYf7Yii+DYt3Yavr0lZFboqjN+wXx0urMsaCiiDcLPSfxa3yukJp9lCW/pnGpMWkVuRdXxBhEVfZgSQC/zQzp/1EdCXwEPBunb6VZIpJMupHPa9W6uZVCu6ROiVlveX1zb+o+04xXJ4WyzPlUl4dwBudezof1GjOuXzIiVpGo4Y2tNWzv3RHlwPmhVxLm0CO8YUyEFYvaFKjxajvYAMIqHPeCa1nfi6DtKX6tbbO0d4oSvWxYEmHq7UEASLh6H/dj1g5RPZp8tONNPZHJqgs/oTHyOrY2Dcst95swOGUN0zeQ35voKP4xemLGdbK6knD+x/Crkr5qXdpvQ9YKsEktboTYB0Ulq87hIx6fEc6ed141uCGVXzQhwlSqFJwMvz5wuqO8yf1eKu6VMob9qKTqtGUbOEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(39860400002)(396003)(376002)(956004)(8676002)(5660300002)(1076003)(8936002)(83380400001)(44832011)(38350700002)(55016002)(6916009)(9686003)(478600001)(316002)(2906002)(38100700002)(9576002)(6666004)(26005)(33716001)(4326008)(6496006)(52116002)(66476007)(66556008)(66946007)(186003)(86362001)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uJvjeMM3nZeiCeAB4un1y/GTxqHhnuo+iObiowLFx/risAFyidiU1A6cPOdJ?=
 =?us-ascii?Q?sBqZOvFFtNr7A1ZBHwy+KDu2dxHlVuWSa676hfAIMTNlW2BpPtF3lgAn8BEt?=
 =?us-ascii?Q?k2ifzHLDd81y9X037Qc5zcgZ0Sd2Gms1sxC8WjCn8KpEYk9bl5UwnhGFmirI?=
 =?us-ascii?Q?cm072Q9rVZiCwg/zlm+W/lIZPtX7bXFgePP4FoakbbsueA+RoDvnPgY3aYNA?=
 =?us-ascii?Q?z8g8x19hu0xZOUT0Df4wWFomgvbgeXNe8mmxfjWdY9fgSE1r4nJ4w2v1Sj/c?=
 =?us-ascii?Q?O7p0R/bJjEpLt/irbEIeGT7eTCUtaKDM6xw3X2Jgh1eWA+1B99xSX7BEvTx6?=
 =?us-ascii?Q?dvLc6+cv7XyjrV4MATOReVABi3BMC5m+4x8yHmB0my5+qK4Lxbgk73KV1EI9?=
 =?us-ascii?Q?LE2h2OxZj9nKvafONh2+yB+G5YeqcFw9f/QwS9LSaPRQg9TqGnH7R1AAxLRG?=
 =?us-ascii?Q?YGBW0UgJ8Sl/URKJvctYGylCPFzw4L0UyS/t+ruJO+A2bA0wV/JvEa0riBmC?=
 =?us-ascii?Q?FD+mwaTjsZK7/Bdwz4RQ0MMm4RFCNX68VdW+jdkg3x7WW56xPcT+hqscWReo?=
 =?us-ascii?Q?Rhg2Tb4kiCOWzzQBVrnJrlI4wPseQ9yDDdUyUZHa97asvwiFKqCKGqf7jYE9?=
 =?us-ascii?Q?J9fwfDfpiPk2OD67jirL6Wf16Ya5qkYP7jWJsA6XFR8AFrbXXn8ureNMS2fs?=
 =?us-ascii?Q?oJE5wUdMNv3SQt0qfqrDC7Ta9SkFRhGaSCqGoHXs5qerHdWhHSY2BosYeIAN?=
 =?us-ascii?Q?qDboZkFd7gZ5Vmm44hJr++Psc5+Guxa5L2rNfwmWgqGUt/JL1bYvEMGrxTuH?=
 =?us-ascii?Q?OLHaOLbAWZPr1evw31fUL1lQdTbvQPzcm7YNf7LRXRTfmQhSCMy7G/rpdED4?=
 =?us-ascii?Q?StN2sfKi0tBUw1Y8HDym8pUv2AZtP63sGmM2WYDewsmTNhVq/8IwdUWxji/R?=
 =?us-ascii?Q?lEYuabOIu2AkAGg1XVMzNB+yNWfDwsYZJf3m2il5ctxlCSW+d9oRxoX62Nr+?=
 =?us-ascii?Q?mgsmbbNgdu9/rQmxg5VahtWfVLXCkz82rirnfxCRbIIGbjZEm3b+4KP3V+h0?=
 =?us-ascii?Q?EqWzVy8N29TiuYIVNmqyUGCVhH3DuGvycUPo5K4LuEr6aW7GHvIpYBpXlCH+?=
 =?us-ascii?Q?XZPrxDh8hB9Ip5fh0o1AglVwjP1jVY+7twe1bjx8BlJXAAX+/PexL3yAdOfA?=
 =?us-ascii?Q?upJXTn2pViYL6sSFidTc+7bXfMShi92wfDZ6FmKyfN3++rQewT3PYxLAhlhQ?=
 =?us-ascii?Q?28mdANF5O+kTVdhNe6iMqBgv6wjegNgt/QVz6lFUM7PXSWtaOuod7d3agc62?=
 =?us-ascii?Q?x7mMETMfN/4Mm9Yub/PK5f/z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c092619-95c6-4403-fe11-08d955c384b3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:40:48.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: og3B5hoSZ6v+l4HeBKRWTyy4SZtN+cqqMG/zNevpp1is4eTdDxyHRWuvkJczxijpH1/JENC5b6SWa1OJvZ3EUBSkRZEuQkNOlwwZ/EW9tIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10064 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108020094
X-Proofpoint-ORIG-GUID: DJOhFISnecXy9nzIR2nfdmMJyetyMcGG
X-Proofpoint-GUID: DJOhFISnecXy9nzIR2nfdmMJyetyMcGG

Hello Jeremy Fitzhardinge,

The patch 4bac07c993d0: "xen: add the Xenbus sysfs and virtual device
hotplug driver" from Jul 17, 2007, leads to the following static
checker warning:

	drivers/xen/xenbus/xenbus_xs.c:125 xs_request_enter()
	warn: sleeping in atomic context

drivers/xen/xenbus/xenbus_client.c
   413  /**
   414   * Allocate an event channel for the given xenbus_device, assigning the newly
   415   * created local port to *port.  Return 0 on success, or -errno on error.  On
   416   * error, the device will switch to XenbusStateClosing, and the error will be
   417   * saved in the store.
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The documentation is very clear how it's supposed to handle the error.

   418   */
   419  int xenbus_alloc_evtchn(struct xenbus_device *dev, evtchn_port_t *port)
   420  {
   421          struct evtchn_alloc_unbound alloc_unbound;
   422          int err;
   423  
   424          alloc_unbound.dom = DOMID_SELF;
   425          alloc_unbound.remote_dom = dev->otherend_id;
   426  
   427          err = HYPERVISOR_event_channel_op(EVTCHNOP_alloc_unbound,
   428                                            &alloc_unbound);
   429          if (err)
   430                  xenbus_dev_fatal(dev, err, "allocating event channel");
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The xenbus_dev_fatal() has a bunch of sleeping functions like xenbus_write()
and we could be holding a spinlock here.

pvcalls_front_connect() <-- holds &bedata->socket_lock
 --> create_active()
     --> xenbus_alloc_evtchn()

   431          else
   432                  *port = alloc_unbound.port;
   433  
   434          return err;
   435  }

regards,
dan carpenter

