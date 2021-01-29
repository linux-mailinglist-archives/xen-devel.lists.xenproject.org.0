Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA372308909
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 13:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78115.141955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SnV-0005Fd-12; Fri, 29 Jan 2021 12:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78115.141955; Fri, 29 Jan 2021 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SnU-0005FD-SY; Fri, 29 Jan 2021 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 78115;
 Fri, 29 Jan 2021 12:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5SnS-0005F7-VR
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 12:22:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe6b783e-1c7f-49d7-ae91-91cce653aaf0;
 Fri, 29 Jan 2021 12:22:41 +0000 (UTC)
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
X-Inumbo-ID: fe6b783e-1c7f-49d7-ae91-91cce653aaf0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611922961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=uxOgdaHXh/ixRuzb1Ke3li4GZk3UbfKkJv3Gxdm5cfM=;
  b=dFXXoELu++uroucFae++TirgDj308qoLZ+fQ6qjkWBCJZd/74v8BnvlQ
   nO/sWrEk81Ziae4vbxLd/RSxZcSVyj48g61MMvM1c4PvvHTYg9gNOkDxE
   RWPK5pomfmXjQrHv+9IvnYkiD0IpdTNv1N/LSdD3FU/h/43/NnYOo8UJr
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NEEFk8A855YJ6QiqXulZTH5TsPoFi+qksjxAC8wswaJAY6kCYUUalEo4tm53M9ePHAwUgNxHkW
 vNRE7kU7eQYVJG/WSaM6vIzCfWnIOk0c31q3iah6a+viU82YBZFAgv5vaBX8E68vkMeGIRRoDR
 S0//zRXnBXQf3zne6/GiKIPu5ICEyrmyAQscuIge55sS/H4H/7517wZRDlT3aPHFAtZ/Gc+3en
 CRmkHqbGQIlTnZ6G5pmX5d7N4sf4KUUsj/SyyxHo5pYUR95rx7pompQmuZUiCBsjop0Q7hCvZh
 cfE=
X-SBRS: 5.2
X-MesageID: 37470732
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="37470732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ouh/P2qmpMzaZ6qp9POQYJsMZDubp+37nP+cqnVc8ZoO5fS+ja3B8ncN/uf6UO77c5lGpffOZz3Ufa3/jvuK9wBNprYYost8qaWt0fgk/wMiKng6hSN5n3hC2EGeprXUsLDMmbbIZL0DlQTQawc/B+N6k8uSNTbFr5tfDuPSL0LrFnFb+q5CCooiT31KfLLSj1km0liWzw52EIrhTjvziWvSjqcHdTWmIoJLSbWYoM6E7cpHqfLn2fBUQseAC+AtMDmzOP0qAI5I96+uJv+2yfLGj3XnDmCOTGkhPkmG8evivwBqNhKT3Nik+bgGsxIEz3SV1XYOSBhn8TI/X4VLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhAwqTfZDwNVzhA5n6mxxW2V7MHKr5x1qfYqt94dyMY=;
 b=VZWAQN7T4GjlaJzT7d8ccAW8idPMU+BAh3fADfO7g9xneqSbBRZW7DZqT/HBWuzQg3C2FHKw7jRfZ+iXcaAn5BKZgCuu2UoU9Z0dxaQySpS1zi3hjwj3Tij/5Dhaza1IhfY55rI/BgjvbV9npOP0DlKcy9gNWZadg3vXVjPjihe8qujXl1xuM6Ov5c/bA1CU+7At7oTTFJdIfi9GmL3AOmoAhEEU+MdcrSMHZwdEPR5GPgBGXB75Kqst7qrDQVgUlaFt/pmlO6QAXPKKtGZsVnWcjvdbE4wCYNHgie5f3+IlYFiRGeI7xBM1OW+AAfhDiAUAqKgZkA5RzKjKOiNmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhAwqTfZDwNVzhA5n6mxxW2V7MHKr5x1qfYqt94dyMY=;
 b=B1gbGQYPnew+AvIxnEVl+lx7PJy+pmnODvRN6IeIKQxfPnjhEXf08CzIqDJ3t3dyXe3MZOw3qeieFHvWa9QCQ6VhEDgz60IkAgATGv5g29l/2MHIeO6cmekQmkQwD59rIF7tBi6wfopalznCdN6koJKGehK1ui2uIOszlKDtnlY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <stable@vger.kernel.org>
CC: <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH for-4.19.y] xen/privcmd: allow fetching resource sizes
Date: Fri, 29 Jan 2021 13:22:15 +0100
Message-ID: <20210129122215.19482-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YBPlDmlJTK78clC3@kroah.com>
References: <YBPlDmlJTK78clC3@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3cc8bb-b664-4b17-ec0e-08d8c4508f91
X-MS-TrafficTypeDiagnostic: DM6PR03MB4138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB413880AA38D88FD4134B06D78FB99@DM6PR03MB4138.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kn9h1nqXiOPBCWynRsw9odATBM7cONBEOt3GlqJEZIwUTjbyZbjt7k1rg/WLQqkpYQt0xj1sPOfiVEGY5Aj513CeNtG10oxBy5Au28+VToCDclYwCBW1qVQeo3PzHwhbIGh/TfqbX0mgEcrzDOxnv+85M3BOvLZUIFRgL2kI14kz+AcYNH5OthDeBOnO3eEPX7Ouc8MzY9sS+VUZziFMSBy1+ABwzsbDnIZELx1XymYPKBVjbdX1AaEV756si6GGhAxmDU3Ej/6SZxzVh0ZrL+u1fF6mPxTqrxh7AajlEABvmdvMpvLvMZoEVJC2eS2lNXd8EZQS7NfzG9yR2brP71vRcHhdJy6H/w/SfGtj/Q3VuB4ITkcjOu58g+zlWliAG6BLiYumApGE6owtaa37/kRYDUoUEM6/3nEGeVImuBHvJThRoUGB3XIswXdf4DLyarkgX/0Q+fsqRh1SwCub2cFvJI8CbZa/8/0KJy7N4Eu+RtZP6N77pvz9wWEqk4E56/K0mH5E9IpDCHLPY848tg/JxkFennJTIHImeSnVoRtUISKQ4K49OkOqVXWJNNJxbaRXnWF35lnLJwSO2XXXHkKGMhC1iSfgkj2ouxpoDv8vJZp4WoI7YziJHWOHQy+O8fLMJS8uCXc6LIZp7Ow0Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(26005)(86362001)(5660300002)(966005)(316002)(2906002)(6496006)(6486002)(186003)(16526019)(1076003)(6916009)(956004)(83380400001)(2616005)(66476007)(8936002)(4326008)(54906003)(478600001)(36756003)(66946007)(8676002)(66556008)(6666004)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTBIQzBqNW1YRjc4WnUwekZOSVo2LytTbTV5SmFFMEFhMUE5Ty9IZTF1YmU0?=
 =?utf-8?B?MkxsUUNMUWFSVGYwaS95OG5sSEtEdStpczVkbEVCY0ZJekJwWkdjcEpUckFE?=
 =?utf-8?B?UUlWdExNbU95bzYxRHVCZDVkck1mZzh5QjI3c1kwNVJBZ2dTK2lkQU03eThB?=
 =?utf-8?B?NFU0d1pBZXZQRkJXalh0blU2NUJibUVUbVFuRmZiMmJXSGxDb1hQdjJGY0dq?=
 =?utf-8?B?VHkybW02NCs1cGpWNUJ0ODk3Z1VNbndTRjFjSXgzNzhPZjNCclY0eGNBYTdu?=
 =?utf-8?B?dldVNnpHU3VUYVhEYUIzL2xBMURqd1I1NEpaRk5wbEhHa3BZeVZrc004aWRT?=
 =?utf-8?B?VFZIcTUvZElkL1RvdE5kY3lnZGlsbzFmWW05SHEzNTMreVVieEVUeWlWbDJD?=
 =?utf-8?B?MUZsT3REa3pBaXRSY2FsOGJVOG1LOS9LeVpGTjFlVUYvTk5JQWhYbjN0aUU4?=
 =?utf-8?B?Ym83bDI3S3Z4WC9rMjY2enVoeFRFRjRNM2lKemh2ZW1sOFZQekxhLzVOOEFW?=
 =?utf-8?B?Y3diSXVUb2lmaEJZYkp5ZHdFN1ZMZVZraGJVcG94eExoeHJZUFlhajJWQXJZ?=
 =?utf-8?B?NWVGc21aWGRBZm1HdjlhWisrSS9iN3NuL1hrRy8yZVVRbDFkMjc2Q0k5RFVz?=
 =?utf-8?B?c3JyRllyNVR3bkFpZUlQczA2UE5GcDhEV3VQY0VwVGdnN3MvZ29VUzZ4b3F2?=
 =?utf-8?B?K2F0OCtYdFhTdTZtdzJPME9uV01WRWpZM0RvL011VUtVbU5GNUFYN25udFVV?=
 =?utf-8?B?b1lVN25MVkJadkRhalN6UVh2RTNRRUUyL0tjNDIwQlJWaEdKYlZ3d0Njbm5X?=
 =?utf-8?B?cExGalhsOFJ2UXFUa3k4WHNlOVVhRUswUVY2M1NXNkh6RjFwSU5IenMxNkUy?=
 =?utf-8?B?RXhGSUwvSzBiVVA3ZGdNS2xONDBvdm1SOVdNS1pGMHZRNnBMV3pkS0d3c00r?=
 =?utf-8?B?UndUQ3gwRlhYY1IySlFrenhuWUQrWlFtTkxxcDhZRlIzUCt6TERlekhjd1dY?=
 =?utf-8?B?L0J6VVFIR3JZTEdreVJId3dFZ05wTnBXOWcyOW5vd0pIaVREVTdlSWdYMTht?=
 =?utf-8?B?WlZTMExzUkUrTzk3ZXpCQmpLN2RZcmxxQzY5UjFTcHJ5TXEyUEcrVXhtUzBk?=
 =?utf-8?B?YkdXdlRkdHl5Q1AzUHhFYXZrZzhoRVFUbEtXYWdsL2NxOElIOUYvNU16eTN3?=
 =?utf-8?B?bFBDK1FSN1IyUU53YjhKRWswRFhTTzFsL0o2VTNLZ0F6cUpkL2ZRSlJKSTd2?=
 =?utf-8?B?dm5JcjF4cjNZdjQ5RjVkZDNsZGJXU2d3bW9oUloyMzVlcUEwYWJmaDlRalpP?=
 =?utf-8?B?Z2J4VmZzQXZIb2Ixb1pIcXZoanhvK2QwVHlmVjBlQUp2T3d5MkwvOXRDYXVQ?=
 =?utf-8?B?bG9kMU85dTNBd1BRVlpMbWVZemRCMmVQMTBnSzY4c252b04xeDFwbkRHaTRa?=
 =?utf-8?B?T2QrRVVVbnlXbTBYaFdRZVZzaGozNEwveFBNd2x3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3cc8bb-b664-4b17-ec0e-08d8c4508f91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 12:22:36.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqJmNmdcjkrDfFGCbcjfSqv/m//YTK1GLHv3NzrxwPQp9o3C83QwR8LpJ1WL12fCkx4sGUWSW3gOxK2mWmefsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4138
X-OriginatorOrg: citrix.com

commit ef3a575baf53571dc405ee4028e26f50856898e7 upstream.

Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
addr = 0 in order to fetch the size of a specific resource.

Add a shortcut to the default map resource path, since fetching the
size requires no address to be passed in, and thus no VMA to setup.

This is missing from the initial implementation, and causes issues
when mapping resources that don't have fixed or known sizes.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: stable@vger.kernel.org # >= 4.18
Link: https://lore.kernel.org/r/20210112115358.23346-1-roger.pau@citrix.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/xen/privcmd.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 7e6e682104dc..a8486432be05 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -743,14 +743,15 @@ static int remap_pfn_fn(pte_t *ptep, pgtable_t token, unsigned long addr,
 	return 0;
 }
 
-static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
+static long privcmd_ioctl_mmap_resource(struct file *file,
+				struct privcmd_mmap_resource __user *udata)
 {
 	struct privcmd_data *data = file->private_data;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	struct privcmd_mmap_resource kdata;
 	xen_pfn_t *pfns = NULL;
-	struct xen_mem_acquire_resource xdata;
+	struct xen_mem_acquire_resource xdata = { };
 	int rc;
 
 	if (copy_from_user(&kdata, udata, sizeof(kdata)))
@@ -760,6 +761,22 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	if (data->domid != DOMID_INVALID && data->domid != kdata.dom)
 		return -EPERM;
 
+	/* Both fields must be set or unset */
+	if (!!kdata.addr != !!kdata.num)
+		return -EINVAL;
+
+	xdata.domid = kdata.dom;
+	xdata.type = kdata.type;
+	xdata.id = kdata.id;
+
+	if (!kdata.addr && !kdata.num) {
+		/* Query the size of the resource. */
+		rc = HYPERVISOR_memory_op(XENMEM_acquire_resource, &xdata);
+		if (rc)
+			return rc;
+		return __put_user(xdata.nr_frames, &udata->num);
+	}
+
 	down_write(&mm->mmap_sem);
 
 	vma = find_vma(mm, kdata.addr);
@@ -793,10 +810,6 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	} else
 		vma->vm_private_data = PRIV_VMA_LOCKED;
 
-	memset(&xdata, 0, sizeof(xdata));
-	xdata.domid = kdata.dom;
-	xdata.type = kdata.type;
-	xdata.id = kdata.id;
 	xdata.frame = kdata.idx;
 	xdata.nr_frames = kdata.num;
 	set_xen_guest_handle(xdata.frame_list, pfns);
-- 
2.29.2


