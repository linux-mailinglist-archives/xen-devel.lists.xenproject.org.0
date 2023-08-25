Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAEE787EE6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 06:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590466.922760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZO7Q-0000PQ-1F; Fri, 25 Aug 2023 04:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590466.922760; Fri, 25 Aug 2023 04:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZO7P-0000Mk-UW; Fri, 25 Aug 2023 04:08:19 +0000
Received: by outflank-mailman (input) for mailman id 590466;
 Fri, 25 Aug 2023 04:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZO7O-0000Me-Ao
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 04:08:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03bfb89b-42fd-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 06:08:16 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM6PR12MB4941.namprd12.prod.outlook.com (2603:10b6:5:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 04:08:11 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 04:08:10 +0000
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
X-Inumbo-ID: 03bfb89b-42fd-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFGWoKO875yidIljnY7uCSZBuwT+9nafdB33tc4tNRrWQu+GEzwnsEsXJ60O86VsGHoUjw4m6W4cFq+7I3PC69wQ6uDEAowjCJhRA6jPn6Y7LtuQxOPgAT0w9uhW47khIy9Ola7WcH4CadVlWwq/79eTojlup2ftLhTJsQDL7sVnL5dlQL8pC5F54qFAlP+YgsiBena8vcvZ6AJ7N812AWvUbo2/4CovFk8wzNOrQSbssXEzgzxtLR3y23bDIc4t66pYEKL28yE8B0YvvXo1mILYygayUNI8sEWokCBA8eTbjqOEQcL2IHGAsUyAzEE/uXwGh0rD1Sz6b4TdFynM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaYgviboBmkdY9fB+dvzdCj/khpGJqJRqXrSgA+ERrE=;
 b=KREcUjyJd1MRDUtvzv4HY1i0iY2zDZ13opqyaHxgQ2s700QK0QS5GdH2sLtm9ws39YYIXR+u51v2FGUXk+5dGk740CormPLFkomewzJTYSLfK8fp9tT6LTF5jSyvMcAXNVuS65FN1hXcPb1Y/x+D3tcpHB6WYCBnA6UPxc1a8pTvxJ3GAWfelYFxZillZzsQCakktPMo5h5mqGnDIHjaXiMAC28+iO16YCkv9YlXrxKOA0faY13qKI1rfnT6td3fihWOdGO7idmDDYihj4T6uuPiFLWvLoDpw1wf6ACtYybg72ulscSwiznw/JjfQEN3p/Uzd92WCebr6q2c+8ejEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaYgviboBmkdY9fB+dvzdCj/khpGJqJRqXrSgA+ERrE=;
 b=mELh2WabPqaplSGyXAey5BNtQrbY55opnJOP9CsMzMNIrt2jNu2/h7L7IIDAz9cdZ3U1SxrZVHaYPKc4LZusnacWe+YHe2BufBo6yPtjPyR7OSp7LOQQOKNPCBVayb7Smq3cJs5RDgKUrNQzWMsJ/aLHF67fwsEXL/lHcH5wZ4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 21:08:01 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v9 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Message-ID: <ZOgpIaPhV7QrgXTl@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-9-vikram.garhwal@amd.com>
 <b18ef35f-a4df-4121-9b3c-aa96a8002d87@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b18ef35f-a4df-4121-9b3c-aa96a8002d87@xen.org>
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM6PR12MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ec797e-392e-4816-fad2-08dba520e500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CdlV3xj44wuozn5c8V+JatLnpctXbOikZZstoTtv2XqYv+Y7qMHs6eY0/QY3V+iRgVLBB7FC17Z1HHu2tRLFGoNYb29tbewpxhk8SGV1zzKdDCmxkxq8ZfkFvx3N5UVGDLWnehlbGpzA4KxYljcjtNVIshflsEtaMdp8/1wMIZBvb9tEqKlswW6SkdyNUzHfCsbhG0uYcRXimiM7Pr0MQCZuhABgQ/KhhyBYzQvcHJsaIk1TFwA8hFAdOPDjTFayn7XTKOv2ZroyWuQ4VZy1MjrIYup+mPhWn5Imr3L+ctpFkwM6/1bwqOb7eCb7aWkPnxrDtySqc5PR6Utm8zfDiqOdwH64m3cxz49piIq0ELCj+mxP3VtF5sGKBGjGChwUqJ5ulusbc36rUY42TD/c9osxw6Q36CI7/nSviq56YYDCiV9sVgBxDgrtYu2bqoSHSReAekZrIkWdzYZ1eYgT/P5ZYSG1pWC2GNbZ0vY2oNypRUUlk5LXTGPHAYkTlegvixauPioAsUojmk5pDF2lEapaCRSF6UQiOWzGIlCoYL7OBusTDgUUcAQ19tj3bfXyHrxBeGW/qrdsTyqqT6aIk/LRhuMgIyVMEk5X7JTzfIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(66476007)(66946007)(66556008)(316002)(6916009)(478600001)(26005)(44832011)(6666004)(38100700002)(41300700001)(53546011)(86362001)(6486002)(6512007)(6506007)(2906002)(4326008)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003)(37363002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBQVTVUYUpUQXA0amJ1SXd2elRaRHZCQ0FEcklzbXd0czhDbEprc0lBSlVn?=
 =?utf-8?B?ZXc2U1hLdG1PN1NZVS9xeFk5MkozWUxUeTBEWDRoYVdlbzRUODcrVjQ2VDRD?=
 =?utf-8?B?ZEs2TWp4azJHZDF3V0FodDRRdmQ1WkthTmpYYmUwY202TXZRWXZXQVpHZWxH?=
 =?utf-8?B?NGZ6RzAxVEkrWDMyN1JrRUIvRm9zQUZwWERqVTIvNzhsTkdjVy9xdUhUUEdB?=
 =?utf-8?B?NGJ2Tk1xTFp6L3JFeGVtSHNBaHAxdWhEYTQrVW44SEtFZ1U3TzFJVFVENEk1?=
 =?utf-8?B?cGllVlhaTWNxcyt4Wk9JbSt2SjdXZlYweVdlbGNjMkl3NUFmcWNDQ2F3SnlY?=
 =?utf-8?B?cWhoWTYzQUUvRHBHY1JqZkNUK1hhZFQ5NzV1QUtnR0Z2TEJkcFBCOURIVjNN?=
 =?utf-8?B?OHplUUFkaUkvN2t6ajBhVW9JaHpWVmNXZ3pKdVBEQ3lXYUV1N1loeXQwSzB0?=
 =?utf-8?B?V0pqYjN3UUJGZFZ0SHZ5SXNQbitHUG9nK1d3dGFtL0wvbmxiczUvK2RmWUZB?=
 =?utf-8?B?Q1BiTGN0ZEhtcms2eVZuNE1GRDdPNDF1MU5ka0hxbVRoNGVoSHAzUnp4MW0w?=
 =?utf-8?B?OGNYM3RvWjRxQ2hCa1RlTGN0Y3RDYWdYRzl6N3h6R045TERaZC9yTGpDOU85?=
 =?utf-8?B?bkhVZzhsYXhjWUpCZ3RWclpCb3lVUW5qcmJXdjJYNnNkelpkOEQxaTJGMTVY?=
 =?utf-8?B?VnAveFVjNVNTQkJ2enUzejRZcGxqL0hpU3QyWUtSSVFmSnBBckN1SGEzNmYw?=
 =?utf-8?B?RExZT2U2ZUJlUUNhdjBjQzV3VVF3VTgyanAyaGFoNExRV0tVK0tjUElydTZz?=
 =?utf-8?B?MW1NK3hJL045RWw3MUtVNHdiY1pLRXBXbm5qdm5RLy9oemFVblJ2SFBEekZh?=
 =?utf-8?B?SFE2dEpTd0NJYm1uNStrZnM1dnVQWWM5c0REQk1qS1VLN1I0SDNwL0pCNy93?=
 =?utf-8?B?aVdUOU15LzFIdGJQOWNuMGNyekh5TE9SNDJiTERTQkNxRURiRy92dVZoRFJG?=
 =?utf-8?B?eHJrVkVPT2xzSXlTbVBnaVY1Zk91WXdNMis4ZlA3MWIzTlQ1azFTSHVmallT?=
 =?utf-8?B?blorYTlva0EvSXVpbVA2Z1NnRGx1TzhUNUxaS2NlRDlIdXZCclIyVWVoTXFG?=
 =?utf-8?B?N3dkanBSNnNEL3NSNjZOQVlYL3VwbkYyWk9HOG9IbHNGT05FbW5rWlRTZTVI?=
 =?utf-8?B?eTJXZTRIMllNSWV3YWl1RkxvUm42UkR6anhlQldmTTY1T3gwUmdteElGaVI0?=
 =?utf-8?B?d3BHRmlZMjRKSGtIaUNybDVsVzBMOHRFREtVbDRaWXBpUytYc2YrbFcxK1ov?=
 =?utf-8?B?WE0yM05WMEhIRmxaeTBYb2tjU0FkdUFuS095QnRsOU5qOUFUVVptQTNVSWFO?=
 =?utf-8?B?S1AwdjRKaUFPREJFS1ZGZ2lQSEZXR2Y4NmRPeTNSaURCS3k0MGZFa1U0a293?=
 =?utf-8?B?QWZxZzdmL2IrdE9SS3ljdlFQRERhWFBuYTVhQ1ZVTEZKV1JVQ3IxQUZFbWVM?=
 =?utf-8?B?ZXBXU1BGeG1XbEUwdVB0WDNmTm16Slp0V25SdmUzSmpoUUMwSWp4Uys3SjBU?=
 =?utf-8?B?bHNBamZsbmFNNzdFNXlSYjYvWTdnVktZdkNxOHREcDhKeG05MHM2SjFMN1hl?=
 =?utf-8?B?MXpWa0pkd2pmdW8yR1BhRG1WV3hFdFlMeUdPejY4K3dXMTIwL2ZlNkRGMVh5?=
 =?utf-8?B?enVEc2RqMTRqMzR5MFB6M0tXMW0yVHkvU05CeCtqMVpBQU45anRoaWFsOXNn?=
 =?utf-8?B?WG5odVVQRXZ5WFFVcGRFdDIvUzV1RkU1dE1CKzdVbWFvdy9IcmVhM2E3MUlv?=
 =?utf-8?B?Q3FqeklpZlAzaUFnekJTa282SENmbnZzWnJXa0xUMTVuaTJKTEZINm5FbWk0?=
 =?utf-8?B?dVZQblhkK1dlREh6Qk9vbVpoeXE5TW0reUVxRXZNSFJac3g0elA5SU1DcmZH?=
 =?utf-8?B?VHdwNVJDalkzamFvUHhlbnZCZHlPdm1hVGZBTnVyMk5MenRITXZWUnc0d1pZ?=
 =?utf-8?B?K1drOUpYclZpWEtiQ0hYRVEyV1hBT1h2Y2kvcmJWUkVSbHdOU2RKMjI2aytk?=
 =?utf-8?B?YUhmd0sxeEkrMmpOclBWVzg4dkNkMUduMWE3TEJ6NlBraDhOWW4rWmFqK0ZD?=
 =?utf-8?Q?bAh7l4FHwy/oNH50FaEZH4aRm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ec797e-392e-4816-fad2-08dba520e500
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 04:08:10.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l3in/kTAs1vl4cKjz3FGcAWYfsLpyQF37YXXUAYqx7hjiTO7rLBa4UwST/uDfqCFEjX7bw9UIPwUfGl182nHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4941

Hi Julien,
On Tue, Aug 22, 2023 at 08:21:17PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> > Add device_tree_find_node_by_path() to find a matching node with path for a
> > dt_device_node.
> > 
> > Reason behind this function:
> >      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
> 
> Typo: missing space before (.
> 
> >      device_tree_flattened) is created and updated with overlay nodes. This
> >      updated fdt is further unflattened to a dt_host_new. Next, we need to find
> >      the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
> >      and add the nodes as child under their parent in the dt_host. Thus we need
> >      this function to search for node in different unflattened device trees.
> > 
> > Also, make dt_find_node_by_path() static inline.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> > ---
> > Changes from v7:
> >      Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
> >      Fix indentation.
> > ---
> > ---
> >   xen/common/device_tree.c      |  5 +++--
> >   xen/include/xen/device_tree.h | 18 ++++++++++++++++--
> >   2 files changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 67e9b6de3e..0f10037745 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
> >       return np;
> >   }
> > -struct dt_device_node *dt_find_node_by_path(const char *path)
> > +struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
> > +                                                 const char *path)
> 
> Any change this both 'from' and the return can be const?
Doing this will also need changes in dt_find_node_by_path() and
dt_for_each_device_node(). This function calls both of these.
> 
> >   {
> >       struct dt_device_node *np;
> > -    dt_for_each_device_node(dt_host, np)
> > +    dt_for_each_device_node(from, np)
> >           if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
> >               break;
> > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > index 5941599eff..e507658b23 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -568,13 +568,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
> >   struct dt_device_node *dt_find_node_by_alias(const char *alias);
> >   /**
> > - * dt_find_node_by_path - Find a node matching a full DT path
> > + * dt_find_node_by_path_from - Generic function to find a node matching the
> > + * full DT path for any given unflatten device tree
> > + * @from: The device tree node to start searching from
> >    * @path: The full path to match
> >    *
> >    * Returns a node pointer.
> >    */
> > -struct dt_device_node *dt_find_node_by_path(const char *path);
> > +struct dt_device_node *
> > +                    dt_find_node_by_path_from(struct dt_device_node *from,
> > +                                                  const char *path);
> 
> Coding style: The indentation look rather odd. I am not sure it will render
> properly here. But one style that is closer to the rest of the file and Xen
> is:
> 
> struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node
> *from,
>                                                  const char *path);
> 
> Where the return type, function name and first parameter is one line and the
> second parameter is on the second line with the type aligned with the type
> of the first parameter.
Will do!
> 
> > +/**
> > + * dt_find_node_by_path - Find a node matching a full DT path in dt_host
> > + * @path: The full path to match
> > + *
> > + * Returns a node pointer.
> > + */
> > +static inline struct dt_device_node *dt_find_node_by_path(const char *path)
> > +{
> > +    return dt_find_node_by_path_from(dt_host, path);
> > +}
> >   /**
> >    * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
> 
> Cheers,
> 
> -- 
> Julien Grall

