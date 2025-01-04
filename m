Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA85A0165B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 19:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865441.1276742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU8xb-0003Km-CG; Sat, 04 Jan 2025 18:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865441.1276742; Sat, 04 Jan 2025 18:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU8xb-0003I6-8x; Sat, 04 Jan 2025 18:33:19 +0000
Received: by outflank-mailman (input) for mailman id 865441;
 Sat, 04 Jan 2025 18:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJS+=T4=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1tU8xa-0003I0-3k
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 18:33:18 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b32bba9-caca-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 19:33:15 +0100 (CET)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2025 10:33:12 -0800
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 04 Jan 2025 10:33:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tU8xQ-000B8N-1h;
 Sat, 04 Jan 2025 18:33:08 +0000
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
X-Inumbo-ID: 5b32bba9-caca-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736015595; x=1767551595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Zxqc5izWZcqv++Qn3LTRHW/mpIz46TucxWfDkg9PUs=;
  b=FwDI/HSB0GHzoQeXGlPVShMntkgyhvUoeuEdJk77RDhFLGgcki9FcLdy
   BQyEE6Z5LOldLbMzURyk0zN+dmwQGgD4x75WXo0RPoJt8gjRbiOEm3Pds
   VQlJXwSjzBWgc2BJAbvaMcytB+lImO0LMNzGO50p/RVBbttnzQeh6/IMf
   /Oa/MraJNxEk6bROTvdLzIcyrgJxWfnayNKosoOWRMZqIpfkoxekasNvn
   SUOskSTTCp9W6AR30aL+w8otTSPibRufPKGQ6eQow0gfTbSseLQbukvNb
   yaxYRPoElWu70OJTAd5OW0uNvw+FwWHBIyLOxyLmnF0z7J5fnvcP9VqQy
   A==;
X-CSE-ConnectionGUID: mpjkV3QJQyCBgSXaSTRH5Q==
X-CSE-MsgGUID: +5RjqubrQWWG6TbwrqqPLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36381334"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36381334"
X-CSE-ConnectionGUID: /3uRxK37RgasfXozjtkmKg==
X-CSE-MsgGUID: kwfhmatiSymtaMqT+/+OnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107106643"
Date: Sun, 5 Jan 2025 02:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sstabellini@kernel.org, jgross@suse.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: update pvcalls_front_accept prototype
Message-ID: <202501050224.Z3WcNxIQ-lkp@intel.com>
References: <alpine.DEB.2.22.394.2501031501420.16425@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2501031501420.16425@ubuntu-linux-20-04-desktop>

Hi Stefano,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefano-Stabellini/xen-update-pvcalls_front_accept-prototype/20250104-070503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/alpine.DEB.2.22.394.2501031501420.16425%40ubuntu-linux-20-04-desktop
patch subject: [PATCH] xen: update pvcalls_front_accept prototype
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250105/202501050224.Z3WcNxIQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050224.Z3WcNxIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050224.Z3WcNxIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/pvcalls-front.c:772:5: error: conflicting types for 'pvcalls_front_accept'; have 'int(struct socket *, struct socket *, int)'
     772 | int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/xen/pvcalls-front.c:18:
   drivers/xen/pvcalls-front.h:13:5: note: previous declaration of 'pvcalls_front_accept' with type 'int(struct socket *, struct socket *, struct proto_accept_arg *)'
      13 | int pvcalls_front_accept(struct socket *sock,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +772 drivers/xen/pvcalls-front.c

1853f11d72ed46 Stefano Stabellini 2017-10-30  771  
9774c6cca26610 Stefano Stabellini 2017-10-30 @772  int pvcalls_front_accept(struct socket *sock, struct socket *newsock, int flags)
9774c6cca26610 Stefano Stabellini 2017-10-30  773  {
9774c6cca26610 Stefano Stabellini 2017-10-30  774  	struct pvcalls_bedata *bedata;
9774c6cca26610 Stefano Stabellini 2017-10-30  775  	struct sock_mapping *map;
9774c6cca26610 Stefano Stabellini 2017-10-30  776  	struct sock_mapping *map2 = NULL;
9774c6cca26610 Stefano Stabellini 2017-10-30  777  	struct xen_pvcalls_request *req;
0102e4efda76d0 Yan Yankovskyi     2020-03-23  778  	int notify, req_id, ret, nonblock;
0102e4efda76d0 Yan Yankovskyi     2020-03-23  779  	evtchn_port_t evtchn;
9774c6cca26610 Stefano Stabellini 2017-10-30  780  
64d6871827b1e2 Stefano Stabellini 2018-02-14  781  	map = pvcalls_enter_sock(sock);
64d6871827b1e2 Stefano Stabellini 2018-02-14  782  	if (IS_ERR(map))
64d6871827b1e2 Stefano Stabellini 2018-02-14  783  		return PTR_ERR(map);
9774c6cca26610 Stefano Stabellini 2017-10-30  784  	bedata = dev_get_drvdata(&pvcalls_front_dev->dev);
9774c6cca26610 Stefano Stabellini 2017-10-30  785  
9774c6cca26610 Stefano Stabellini 2017-10-30  786  	if (map->passive.status != PVCALLS_STATUS_LISTEN) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  787  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  788  		return -EINVAL;
9774c6cca26610 Stefano Stabellini 2017-10-30  789  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  790  
9774c6cca26610 Stefano Stabellini 2017-10-30  791  	nonblock = flags & SOCK_NONBLOCK;
9774c6cca26610 Stefano Stabellini 2017-10-30  792  	/*
9774c6cca26610 Stefano Stabellini 2017-10-30  793  	 * Backend only supports 1 inflight accept request, will return
9774c6cca26610 Stefano Stabellini 2017-10-30  794  	 * errors for the others
9774c6cca26610 Stefano Stabellini 2017-10-30  795  	 */
9774c6cca26610 Stefano Stabellini 2017-10-30  796  	if (test_and_set_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  797  			     (void *)&map->passive.flags)) {
9774c6cca26610 Stefano Stabellini 2017-10-30  798  		req_id = READ_ONCE(map->passive.inflight_req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  799  		if (req_id != PVCALLS_INVALID_ID &&
9774c6cca26610 Stefano Stabellini 2017-10-30  800  		    READ_ONCE(bedata->rsp[req_id].req_id) == req_id) {
9774c6cca26610 Stefano Stabellini 2017-10-30  801  			map2 = map->passive.accept_map;
9774c6cca26610 Stefano Stabellini 2017-10-30  802  			goto received;
9774c6cca26610 Stefano Stabellini 2017-10-30  803  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  804  		if (nonblock) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  805  			pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  806  			return -EAGAIN;
9774c6cca26610 Stefano Stabellini 2017-10-30  807  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  808  		if (wait_event_interruptible(map->passive.inflight_accept_req,
9774c6cca26610 Stefano Stabellini 2017-10-30  809  			!test_and_set_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  810  					  (void *)&map->passive.flags))) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  811  			pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  812  			return -EINTR;
9774c6cca26610 Stefano Stabellini 2017-10-30  813  		}
9774c6cca26610 Stefano Stabellini 2017-10-30  814  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  815  
9f51c05dc41a6d Wen Yang           2018-12-05  816  	map2 = kzalloc(sizeof(*map2), GFP_KERNEL);
9f51c05dc41a6d Wen Yang           2018-12-05  817  	if (map2 == NULL) {
9f51c05dc41a6d Wen Yang           2018-12-05  818  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9f51c05dc41a6d Wen Yang           2018-12-05  819  			  (void *)&map->passive.flags);
9f51c05dc41a6d Wen Yang           2018-12-05  820  		pvcalls_exit_sock(sock);
9f51c05dc41a6d Wen Yang           2018-12-05  821  		return -ENOMEM;
9f51c05dc41a6d Wen Yang           2018-12-05  822  	}
9f51c05dc41a6d Wen Yang           2018-12-05  823  	ret = alloc_active_ring(map2);
9774c6cca26610 Stefano Stabellini 2017-10-30  824  	if (ret < 0) {
9774c6cca26610 Stefano Stabellini 2017-10-30  825  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  826  				(void *)&map->passive.flags);
9f51c05dc41a6d Wen Yang           2018-12-05  827  		kfree(map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  828  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  829  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  830  	}
c66bb48edd58c3 Juergen Gross      2023-04-03  831  	ret = create_active(map2, &evtchn);
9f51c05dc41a6d Wen Yang           2018-12-05  832  	if (ret < 0) {
9f51c05dc41a6d Wen Yang           2018-12-05  833  		free_active_ring(map2);
9f51c05dc41a6d Wen Yang           2018-12-05  834  		kfree(map2);
c66bb48edd58c3 Juergen Gross      2023-04-03  835  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
c66bb48edd58c3 Juergen Gross      2023-04-03  836  			  (void *)&map->passive.flags);
64d6871827b1e2 Stefano Stabellini 2018-02-14  837  		pvcalls_exit_sock(sock);
9f51c05dc41a6d Wen Yang           2018-12-05  838  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  839  	}
9f51c05dc41a6d Wen Yang           2018-12-05  840  
c66bb48edd58c3 Juergen Gross      2023-04-03  841  	spin_lock(&bedata->socket_lock);
c66bb48edd58c3 Juergen Gross      2023-04-03  842  	ret = get_request(bedata, &req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  843  	if (ret < 0) {
9774c6cca26610 Stefano Stabellini 2017-10-30  844  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  845  			  (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  846  		spin_unlock(&bedata->socket_lock);
c66bb48edd58c3 Juergen Gross      2023-04-03  847  		pvcalls_front_free_map(bedata, map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  848  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  849  		return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  850  	}
c66bb48edd58c3 Juergen Gross      2023-04-03  851  
9774c6cca26610 Stefano Stabellini 2017-10-30  852  	list_add_tail(&map2->list, &bedata->socket_mappings);
9774c6cca26610 Stefano Stabellini 2017-10-30  853  
9774c6cca26610 Stefano Stabellini 2017-10-30  854  	req = RING_GET_REQUEST(&bedata->ring, req_id);
9774c6cca26610 Stefano Stabellini 2017-10-30  855  	req->req_id = req_id;
9774c6cca26610 Stefano Stabellini 2017-10-30  856  	req->cmd = PVCALLS_ACCEPT;
9774c6cca26610 Stefano Stabellini 2017-10-30  857  	req->u.accept.id = (uintptr_t) map;
9774c6cca26610 Stefano Stabellini 2017-10-30  858  	req->u.accept.ref = map2->active.ref;
9774c6cca26610 Stefano Stabellini 2017-10-30  859  	req->u.accept.id_new = (uintptr_t) map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  860  	req->u.accept.evtchn = evtchn;
9774c6cca26610 Stefano Stabellini 2017-10-30  861  	map->passive.accept_map = map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  862  
9774c6cca26610 Stefano Stabellini 2017-10-30  863  	bedata->ring.req_prod_pvt++;
9774c6cca26610 Stefano Stabellini 2017-10-30  864  	RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(&bedata->ring, notify);
9774c6cca26610 Stefano Stabellini 2017-10-30  865  	spin_unlock(&bedata->socket_lock);
9774c6cca26610 Stefano Stabellini 2017-10-30  866  	if (notify)
9774c6cca26610 Stefano Stabellini 2017-10-30  867  		notify_remote_via_irq(bedata->irq);
9774c6cca26610 Stefano Stabellini 2017-10-30  868  	/* We could check if we have received a response before returning. */
9774c6cca26610 Stefano Stabellini 2017-10-30  869  	if (nonblock) {
9774c6cca26610 Stefano Stabellini 2017-10-30  870  		WRITE_ONCE(map->passive.inflight_req_id, req_id);
64d6871827b1e2 Stefano Stabellini 2018-02-14  871  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  872  		return -EAGAIN;
9774c6cca26610 Stefano Stabellini 2017-10-30  873  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  874  
9774c6cca26610 Stefano Stabellini 2017-10-30  875  	if (wait_event_interruptible(bedata->inflight_req,
9774c6cca26610 Stefano Stabellini 2017-10-30  876  		READ_ONCE(bedata->rsp[req_id].req_id) == req_id)) {
64d6871827b1e2 Stefano Stabellini 2018-02-14  877  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  878  		return -EINTR;
9774c6cca26610 Stefano Stabellini 2017-10-30  879  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  880  	/* read req_id, then the content */
9774c6cca26610 Stefano Stabellini 2017-10-30  881  	smp_rmb();
9774c6cca26610 Stefano Stabellini 2017-10-30  882  
9774c6cca26610 Stefano Stabellini 2017-10-30  883  received:
9774c6cca26610 Stefano Stabellini 2017-10-30  884  	map2->sock = newsock;
beee1fbe8f7d57 Stefano Stabellini 2018-12-21  885  	newsock->sk = sk_alloc(sock_net(sock->sk), PF_INET, GFP_KERNEL, &pvcalls_proto, false);
9774c6cca26610 Stefano Stabellini 2017-10-30  886  	if (!newsock->sk) {
9774c6cca26610 Stefano Stabellini 2017-10-30  887  		bedata->rsp[req_id].req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  888  		map->passive.inflight_req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  889  		clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT,
9774c6cca26610 Stefano Stabellini 2017-10-30  890  			  (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  891  		pvcalls_front_free_map(bedata, map2);
64d6871827b1e2 Stefano Stabellini 2018-02-14  892  		pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  893  		return -ENOMEM;
9774c6cca26610 Stefano Stabellini 2017-10-30  894  	}
9774c6cca26610 Stefano Stabellini 2017-10-30  895  	newsock->sk->sk_send_head = (void *)map2;
9774c6cca26610 Stefano Stabellini 2017-10-30  896  
9774c6cca26610 Stefano Stabellini 2017-10-30  897  	ret = bedata->rsp[req_id].ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  898  	bedata->rsp[req_id].req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  899  	map->passive.inflight_req_id = PVCALLS_INVALID_ID;
9774c6cca26610 Stefano Stabellini 2017-10-30  900  
9774c6cca26610 Stefano Stabellini 2017-10-30  901  	clear_bit(PVCALLS_FLAG_ACCEPT_INFLIGHT, (void *)&map->passive.flags);
9774c6cca26610 Stefano Stabellini 2017-10-30  902  	wake_up(&map->passive.inflight_accept_req);
9774c6cca26610 Stefano Stabellini 2017-10-30  903  
64d6871827b1e2 Stefano Stabellini 2018-02-14  904  	pvcalls_exit_sock(sock);
9774c6cca26610 Stefano Stabellini 2017-10-30  905  	return ret;
9774c6cca26610 Stefano Stabellini 2017-10-30  906  }
9774c6cca26610 Stefano Stabellini 2017-10-30  907  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

